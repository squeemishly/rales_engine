class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.text :credit_card_number
      t.text :result
      t.integer :invoice_id

      t.timestamps
    end
  end
end
