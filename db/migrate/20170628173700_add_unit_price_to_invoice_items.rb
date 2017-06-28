class AddUnitPriceToInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    add_column :invoice_items, :unit_price, :float
  end
end
