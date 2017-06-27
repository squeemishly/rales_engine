class AddCustomerIdMerchantIdStatusToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :customer_id, :integer
    add_column :invoices, :merchant_id, :integer
    add_column :invoices, :status, :text
    remove_column :invoices, :name
  end
end
