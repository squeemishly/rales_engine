class ChangeUnitPricesItems < ActiveRecord::Migration[5.1]
  def up
     remove_column :items, :unit_price
   end

   def down
     add_column :items, :unit_price, :integer
   end
end
