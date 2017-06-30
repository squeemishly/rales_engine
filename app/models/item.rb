class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  belongs_to :merchant

  def unit_price
    convert(attributes['unit_price'])
  end

  def self.most_revenue(limit=5)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(:invoice_items, invoice_items: :invoice, invoices: :transactions)
      .merge(Transaction.successful)
      .group(:id)
      .order('revenue DESC')
      .limit(limit)
  end

  private

  def convert(price)
    (price.to_f/100).to_s
  end
end
