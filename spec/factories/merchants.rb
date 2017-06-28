FactoryGirl.define do
  factory :merchant do
    name "MyString"

    factory :merchants_with_items do
      transient do
        items_count 3
      end

      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.items_count, merchant: merchant)
      end
    end
  end
end
