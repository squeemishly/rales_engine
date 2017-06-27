FactoryGirl.define do
  factory :transaction do
    credit_card_number "1234567892100"
    result "success"
    invoice_id 1
    invoice
  end
end
