class RemoveCustomerFromOrderItem2 < ActiveRecord::Migration[8.1]
  def change
    remove_column :order_items, :customers, :references
  end
end
