class RemoveUIdFromOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :u_id, :string
  end
end
