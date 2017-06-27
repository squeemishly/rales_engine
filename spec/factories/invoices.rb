FactoryGirl.define do
  factory :invoice do
    customer_id 1
    merchant_id 1
    status "refreshing"
  end
end
