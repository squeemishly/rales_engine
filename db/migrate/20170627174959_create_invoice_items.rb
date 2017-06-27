class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.integer :customer_id
      t.integer :merchant_id
      t.text :status

      t.timestamps
    end
  end
end
