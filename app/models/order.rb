class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :products, through: :order_items

  default_scope { where(soft_delete: false).or(where(soft_delete: nil)) }
end
