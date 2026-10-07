class RemoveCustomerIdFromOrderItems < ActiveRecord::Migration[8.1]
  def change
    remove_reference :order_items, :customer, null: false, foreign_key: true, index: true
  end
end
