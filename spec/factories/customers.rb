FactoryGirl.define do
  factory :customer do
    sequence :first_name do |x|
      "Mia #{x}"
    end
    last_name "Jaeger"

    factory :customer_with_invoices do
      transient do
        invoices_count 3
      end

      after(:create) do |customer, evaluator|
        create_list(:invoice, evaluator.invoices_count, customer: customer)
      end
    end
  end
end
