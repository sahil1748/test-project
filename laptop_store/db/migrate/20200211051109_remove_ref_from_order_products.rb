class RemoveRefFromOrderProducts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :order_products, :orders
    remove_reference :order_products, :laptops
  end
end
