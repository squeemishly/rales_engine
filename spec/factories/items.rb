FactoryGirl.define do
  factory :item do
    sequence :name do |x|
      "Super Sweet Ninja Sword #{x}"
    end
    description "It cuts with the greatest of ease"
    unit_price 85.63
    merchant
  end
end
