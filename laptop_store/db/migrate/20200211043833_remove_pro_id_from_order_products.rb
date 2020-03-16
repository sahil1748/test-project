class RemoveProIdFromOrderProducts < ActiveRecord::Migration[6.0]
  def change

    remove_column :order_products, :pro_id, :string
  end
end
