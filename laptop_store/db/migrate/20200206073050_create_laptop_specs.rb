class CreateLaptopSpecs < ActiveRecord::Migration[6.0]
  def change
    create_table :laptop_specs do |t|
      t.string :ram
      t.string :hdd
      t.string :processor
      t.string :os
      t.string :screen
      t.string :color
      t.string :weight

      t.timestamps
    end
  end
end
