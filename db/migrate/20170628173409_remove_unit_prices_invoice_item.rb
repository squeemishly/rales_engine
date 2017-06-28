class RemoveUnitPricesInvoiceItem < ActiveRecord::Migration[5.1]
    def up
       remove_column :invoice_items, :unit_price
     end
end
