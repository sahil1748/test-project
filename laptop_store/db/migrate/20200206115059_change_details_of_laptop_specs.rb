class ChangeDetailsOfLaptopSpecs < ActiveRecord::Migration[6.0]
  def change
  	change_column :laptop_specs, :os, :string, default: 'DOS'
  	change_column_null :laptop_specs, :processor, false
  end
end
