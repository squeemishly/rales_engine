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

  def format_price(sum)
   (sum.to_f/100).to_s
  end

  def self.most_revenue(limit=5)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.successful)
      .group(:id)
      .order('revenue DESC')
      .limit(limit)
  end
end
