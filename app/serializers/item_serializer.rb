class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  def unit_price
   floated = object.unit_price.to_f / 100
   sprintf("%.2f", floated)
  end

end
