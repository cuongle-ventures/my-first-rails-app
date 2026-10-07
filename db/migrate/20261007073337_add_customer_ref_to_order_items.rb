class AddCustomerRefToOrderItems < ActiveRecord::Migration[8.1]
  def change
    add_reference :order_items, :customer, null: false, foreign_key: true
  end
end
