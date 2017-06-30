class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_price, :invoice_id, :item_id

  def unit_price
    floated = object.unit_price.to_f / 100
    sprintf("%.2f", floated)
  end

end
