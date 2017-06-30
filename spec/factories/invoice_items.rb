FactoryGirl.define do
  factory :invoice_item do
    invoice
    item
    quantity 3
    sequence :unit_price do |x|
        "#{x}.#{x}".to_f
    end
  end

end
