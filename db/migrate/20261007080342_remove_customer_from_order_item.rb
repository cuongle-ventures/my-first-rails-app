class RemoveCustomerFromOrderItem < ActiveRecord::Migration[8.1]
  def change
    remove_column :order_items, :customer, :references
  end
end
