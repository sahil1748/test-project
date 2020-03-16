class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.text :status
      t.string :tracking_id

      t.timestamps
    end
  end
end
