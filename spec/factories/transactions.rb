FactoryGirl.define do
  factory :transaction do
    credit_card_number "1234567892100"
    result "success"
    invoice
  end
end
