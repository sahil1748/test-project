class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :u_id
      t.bigint :ship_id
      t.text :payment_status

      t.timestamps
    end
  end
end
