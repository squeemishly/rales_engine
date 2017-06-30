class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def unit_price
    convert(attributes['unit_price'])
  end

  private

  def convert(price)
    (price.to_f/100).to_s
  end
end
