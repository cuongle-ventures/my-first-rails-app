class Customer < ApplicationRecord
  has_many :products
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
end
