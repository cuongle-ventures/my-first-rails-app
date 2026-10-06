class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]

  def index
    @customers = Customer.all

    render json: @customers, status: :ok
  end

  def show
    Rails.logger.info "logger #{params[:id]}"
    @id = params[:id]

    @customer = Customer.find_by(id: @id)

    unless @customer.present?
      render json: { data: nil, errors: ["User not found"] }, status: :not_found
      return
    end

    render json: { data: @customer, errors: [] }, status: :ok
  end

  def create
    Rails.logger.info "logger #{params}"

    @customer = Customer.new

    Rails.logger.info "logger #{params}"

    @customer.first_name = params[:first_name]
    @customer.last_name = params[:last_name]
    @customer.active = params[:active]

    unless @customer.save
      render json: { data: null, error: @customer.errors.full_messages }, status: :unprocessable_entity
    end

    render json: { data: @customer, errors: [] }, status: :ok
  end

  def update
    Rails.logger.info "logger #{params[:id]}"
    Rails.logger.info "logger #{params}"

    @customer = Customer.find_by(id: params[:id])

    if params[:first_name].present?
      @customer.first_name = params[:first_name]
    end

    if params[:last_name]
      @customer.last_name = params[:last_name]
    end

    if params[:active]
      @customer.active = params[:active]
    end

    unless @customer.save
      render json: {

      }, status: :unprocessable_entity
      return
    end

    render json: { data: @customer }, status: :ok
  end

  def destroy
    @customer = Customer.find_by(id: params[:id])

    unless @customer.present?
      render json: {}, status: :not_found
      return
    end

    @customer.destroy
    render json: { data: @customer }, status: :ok
  end
end
