FactoryGirl.define do
  factory :transaction do
    sequence :credit_card_number do |n|
      "123456789#{n}"
    end

    credit_card_expiration_date ""
    result "success"
    invoice
  end
end
