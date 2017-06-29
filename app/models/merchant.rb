class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def revenue(date = nil)
          invoices.joins(:transactions, :invoice_items)
          .merge(Transaction.successful)
          .sum("invoice_items.quantity * invoice_items.unit_price")
  end

 #  def format_price(sum)
 #   (sum.to_f/100).to_s
 # end
end
