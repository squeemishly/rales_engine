FactoryGirl.define do
  factory :invoice_item do
    invoice
    item
    quantity 3
    unit_price "85.63"
  end
end
