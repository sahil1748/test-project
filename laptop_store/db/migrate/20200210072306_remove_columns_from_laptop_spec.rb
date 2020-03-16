class RemoveColumnsFromLaptopSpec < ActiveRecord::Migration[6.0]
  def change

    remove_column :laptop_specs, :os, :string

    remove_column :laptop_specs, :screen, :string

    remove_column :laptop_specs, :color, :string

    remove_column :laptop_specs, :weight, :string
  end
end
