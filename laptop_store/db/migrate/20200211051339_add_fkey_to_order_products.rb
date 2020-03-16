class AddFkeyToOrderProducts < ActiveRecord::Migration[6.0]
  def change
  	add_column :order_products, :laptop_id, :bigint
  	add_column :order_products, :order_id, :bigint
  	add_foreign_key :order_products, :laptops
  	add_foreign_key :order_products, :orders
  end
end
