class UpdateDefaultValueOfSoftDelete < ActiveRecord::Migration[8.1]
  def change
    change_column_default :orders, :soft_delete, from: nil, to: false
  end
end
