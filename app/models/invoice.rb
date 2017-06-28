class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.most_expensive_much_money(limit=5)
    select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .group("invoices.id")
      .order("total_revenue DESC")
      .limit(limit)
      # select("invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      #   .joins(:invoice_items, :transactions)
      #   .where(transactions: {result: "success"})
      #   .group("invoices.id")
      #   .order("total_revenue DESC")
      #   .limit(limit)
  end
end
