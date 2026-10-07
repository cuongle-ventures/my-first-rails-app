class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]

  def index
    @products = Product.all.limit(10)

    render json: { data: @products, errors: [] }
  end

  def create
    @product = Product.new(product_params)

    unless @product.save
      render json: { errors: @product.errors.full_messages, status: :unprocessable_entity }
    end

    render json: { data: @product, status: :ok }
  end

  def update
    @id = params[:id]

    Rails.logger.info "logger #{product_params}"

    @product = Product.find_by(id: @id)

    unless @product.present?
      return render json: { status: :not_found }
    end

    unless @product.update(product_params)
      return render json: { status: :unprocessable_entity, errors: @product.errors.full_messages }
    end

    render json: { status: :ok }
  end

  def show
    @product = Product.find_by(id: params[:id])

    Rails.logger.info "logger #{params[:id]}"

    unless @product.present?
      return render json: { status: :not_found }
    end

    render json: { data: @product, status: :ok }
  end

  def destroy
    @id = params[:id]

    @product = Product.find_by(id: @id)

    unless @product.present?
      return render json: { status: :not_found }
    end

    @product.destroy

    return render json: { status: :ok }
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
