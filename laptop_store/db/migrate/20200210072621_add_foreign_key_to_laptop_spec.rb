class AddForeignKeyToLaptopSpec < ActiveRecord::Migration[6.0]
  def change
  	add_column :laptop_specs, :laptop_id, :bigint 
    add_foreign_key :laptop_specs, :laptops
  end
end
