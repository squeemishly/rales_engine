require 'csv'

namespace :import_data do

  desc "import all data"
  task all_data: [:import_merchants_csv,
                  :import_items_csv,
                  :import_customers_csv,
                  :import_invoices_csv,
                  :import_invoice_items_csv,
                  :import_transactions_csv]

  desc "import merchants data"
  task :import_merchants_csv => :environment do
    CSV.foreach("db/csv/merchants.csv", headers: true, header_converters: :symbol) do |row|
      Merchant.create(
          name: row[:name],
          created_at: row[:created_at],
          updated_at: row[:updated_at]
      )
      puts "Created Merchant #{Merchant.last.id}"
    end
  end

  desc "import items data"
  task :import_items_csv => :environment do
    CSV.foreach("db/csv/items.csv", headers: true, header_converters: :symbol) do |row|
      Item.create!(
        name: row[:name],
        description: row[:description],
        unit_price: row[:unit_price],
        merchant_id: row[:merchant_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "Created Item #{Item.last.name}"
    end
  end

  desc "import customers data"
  task :import_customers_csv => :environment do
    CSV.foreach("db/csv/customers.csv", headers: true, header_converters: :symbol) do |row|
      Customer.create(
        first_name: row[:first_name],
        last_name: row[:last_name],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "Created Customer #{Customer.last.first_name} #{Customer.last.last_name}"
    end
  end

  desc "import invoices data"
  task :import_invoices_csv => :environment do
    CSV.foreach("db/csv/invoices.csv", headers: true, header_converters: :symbol) do |row|
      Invoice.create(
        status: row[:status],
        customer_id: row[:customer_id],
        merchant_id: row[:merchant_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "Created Invoice #{Invoice.last.id}"
    end
  end

  desc "import invoice_items data"
  task :import_invoice_items_csv => :environment do
    CSV.foreach("db/csv/invoice_items.csv", headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create(
        unit_price: row[:unit_price],
        quantity: row[:quantity],
        item_id: row[:item_id],
        invoice_id: row[:invoice_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "Created Invoice Item #{InvoiceItem.last.id}"
    end
  end

  desc "import transactions data"
  task :import_transactions_csv => :environment do
    CSV.foreach("db/csv/transactions.csv", headers: true, header_converters: :symbol) do |row|
      Transaction.create(
        credit_card_number: row[:credit_card_number],
        result: row[:result],
        invoice_id: row[:invoice_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
      puts "Created Transaction #{Transaction.last.id}"
    end
  end

end
