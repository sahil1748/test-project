class AddRefToShipments < ActiveRecord::Migration[6.0]
  def change
  	add_column :shipments, :order_id, :bigint
  	add_foreign_key :shipments, :orders
  end
end
