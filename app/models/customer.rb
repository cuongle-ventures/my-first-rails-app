class Customer < ApplicationRecord
  has_many :products
  validates :first_name, presence: true
  validates :last_name, presence: true
end
