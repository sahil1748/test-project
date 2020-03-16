class RemoveShipIdFromOrder < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :ship_id, :string
  end
end
