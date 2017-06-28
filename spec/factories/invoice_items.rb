FactoryGirl.define do
  factory :invoice_item do
    invoice
    item
    quantity 3
    sequence :unit_price do |x|
        1
    end
  end
  
end
