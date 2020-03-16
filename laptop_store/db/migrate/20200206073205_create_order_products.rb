class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      t.bigint :order_id
      t.bigint :pro_id
      t.integer :quantity

      t.timestamps
    end
  end
end
