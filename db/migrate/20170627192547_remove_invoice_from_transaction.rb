class RemoveInvoiceFromTransaction < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :invoice_id, :integer
  end
end
