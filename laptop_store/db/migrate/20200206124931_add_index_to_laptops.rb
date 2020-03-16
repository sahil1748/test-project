class AddIndexToLaptops < ActiveRecord::Migration[6.0]
  def change
  	reversible do |x|
  	  x.up do 
  	  	suppress_messages{add_index :laptops, :brand}
  	  	say "!!Index Created!!", true
  	  end
  	  x.down do
  	  	suppress_messages{remove_index :laptops, :brand}
  	  	say "!!Index Removed!!", true
  	  end
  	end
  end
end
