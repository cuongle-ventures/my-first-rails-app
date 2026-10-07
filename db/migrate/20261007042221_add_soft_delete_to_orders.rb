class AddSoftDeleteToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :soft_delete, :boolean
  end
end
