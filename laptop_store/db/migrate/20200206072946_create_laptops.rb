class CreateLaptops < ActiveRecord::Migration[6.0]
  def change
    create_table :laptops do |t|
      t.text :brand
      t.text :name
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
