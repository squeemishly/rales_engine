FactoryGirl.define do
  factory :invoice do
    customer
    merchant
    status "refreshing"
  end
end
