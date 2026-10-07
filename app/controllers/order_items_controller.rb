class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    @order_item = OrderItem.new(order_item_params)

    unless @order_item.save
      return render json: { errors: @order_item.errors.full_messages }
    end
    
    return render json: { data: @order_item, status: :ok }
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id)
  end
end
