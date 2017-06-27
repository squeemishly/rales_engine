class AddUnitPriceAndMerchantIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :unit_price, :float
    add_column :items, :merchant_id, :integer
  end
end
