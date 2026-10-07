class Order < ApplicationRecord
  belongs_to :customer

  default_scope { where(soft_delete: false).or(where(soft_delete: nil)) }
end
