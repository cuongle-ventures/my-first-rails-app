class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]

  def index
    @orders = Order.all

    render json: { data: @orders, status: :ok }
  end

  def show
  end

  def create
    Rails.logger.info "logger #{order_params}"

    @customer = Customer.find_by(id: order_params[:customer_id])

    unless @customer.present?
      return render json: { status: :not_found }
    end

    @order = Order.new(order_params)

    unless @order.save
      return render json: { status: @order.errors.full_messages }
    end

    render json: { status: :ok, data: @order }
  end

  def update
  end

  def destroy
  end

  def order_params
    # we haven't implemented the auth yet, so we could not get the customer_id from jwt
    # for research purpose, just let pass the `customer_id` to the api
    params.require(:order).permit(:customer_id)
  end
end
