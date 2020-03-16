class Order < ApplicationRecord
  belongs_to :user
  has_one :shipment
  has_many :order_products
  scope :user_orders, ->(uid) {where("user_id = ?",uid)}
  scope :paid_orders, -> {where("payment_status = 'received'").order(id: :asc)}
end

#scope :created_before, ->(time) { where("created_at < ?", time) }