class RemoveInvoiceIdItemIdFromInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoice_items, :invoice_id
    remove_column :invoice_items, :item_id
  end
end
