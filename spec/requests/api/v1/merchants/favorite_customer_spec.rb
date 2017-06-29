require 'rails_helper'

RSpec.describe "a merchants favorite customer can be found" do
  it "by looking at the number of successful transactions" do
    merchant = create(:merchant)

    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)

    invoice1 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice2 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice3 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice4 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice5 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice6 = create(:invoice, customer_id: customer1, merchant_id: merchant)
    invoice7 = create(:invoice, customer_id: customer1, merchant_id: merchant)

    create(:transaction, invoice_id: invoice1)
    create(:transaction, invoice_id: invoice2)
    create(:transaction, invoice_id: invoice3)
    create(:transaction, invoice_id: invoice3, result: "failed")
    create(:transaction, invoice_id: invoice4)
    create(:transaction, invoice_id: invoice5)
    create(:transaction, invoice_id: invoice6)
    create(:transaction, invoice_id: invoice7)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response).to be_success
  end
end
