class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def revenue(filter = nil)
        sum = invoices.joins(:transactions, :invoice_items)
        .where(filter)
        .merge(Transaction.successful)
        .sum("invoice_items.quantity * invoice_items.unit_price")

        format_price(sum)
  end


  def self.most_revenue(limit=5)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.successful)
      .group(:id)
      .order('revenue DESC')
      .limit(limit)
  end

  def format_price(sum)
    float = sum.to_f / 100
    sprintf("%.2f", float)

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) AS invoices_count")
      .joins(invoices: :transactions)
      .where(transactions: {result: "success"})
      .group(:id)
      .order("invoices_count DESC")
      .limit(1)
  end

  def self.all_revenue(date)
    sum = select("sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .where(transactions: {result: "success"}, invoices: {created_at: date})
      .group(:id)
      .first
      .total_revenue

    float = sum.to_f / 100
    sprintf("%.2f", float)
  end
end
