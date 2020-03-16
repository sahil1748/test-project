class Laptop < ApplicationRecord
  has_one :laptop_spec
  has_many :order_products
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 5000, message: "must be greater than %{count}"}
  validates :name, presence: true, uniqueness: true
end
