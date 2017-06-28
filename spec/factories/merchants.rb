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

    factory :merchants_with_invoices do
      transient do
        invoices_count 5
      end

      after(:create) do |merchant, evaluator|
        create_list(:invoice, evaluator.invoices_count, merchant: merchant)
      end
    end
  end
end
