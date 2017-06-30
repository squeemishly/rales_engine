class ChangeInvoiceItemsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoice_items, :customer_id
    remove_column :invoice_items, :merchant_id
    remove_column :invoice_items, :status

    add_column :invoice_items, :invoice_id, :integer
    add_column :invoice_items, :item_id, :integer
    add_column :invoice_items, :quantity, :integer
    add_column :invoice_items, :unit_price, :string
  end
end
