class AddCheckConstraintToOrderProducts < ActiveRecord::Migration[6.0]
  def change
    reversible do |x|
      x.up do
        execute <<-SQL
        ALTER TABLE order_products ADD CONSTRAINT chk_quantity CHECK(quantity>0);
        SQL
      end
      x.down do
      	execute <<-SQL
        ALTER TABLE order_products DROP CONSTRAINT chk_quantity;
        SQL
      end	
    end
  end
end
