require 'rails_helper'

RSpec.describe "a merchants favorite customer can be found" do
  it "by looking at the number of successful transactions" do
    merchant = create(:merchant)

    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)

    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
  end
end
