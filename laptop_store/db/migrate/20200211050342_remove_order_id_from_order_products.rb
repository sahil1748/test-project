class RemoveOrderIdFromOrderProducts < ActiveRecord::Migration[6.0]
  def change

    remove_column :order_products, :order_id, :string
  end
end
