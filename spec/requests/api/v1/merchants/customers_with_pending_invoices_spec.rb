require 'rails_helper'

RSpec.describe "a list of customers with all pending invoices" do
  it "listed by merchant" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)

    merchant1 = create(:merchant)
    merchant2 = create(:merchant)

    invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id, status: "filled")
    invoice2 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id, status: "pending")
    invoice3 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id, status: "filled")
    invoice4 = create(:invoice, customer_id: customer3.id, merchant_id: merchant1.id, status: "pending")
    invoice5 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id, status: "filled")
    invoice6 = create(:invoice, customer_id: customer1.id, merchant_id: merchant2.id, status: "filled")
    invoice7 = create(:invoice, customer_id: customer1.id, merchant_id: merchant2.id, status: "pending")

    get "/api/v1/merchants/#{merchant1.id}/customers_with_pending_invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.body).to include(invoice2.id)
    expect(response.body).to include(invoice4.id)

    expect(response.body).to_not include(invoice1.id)
    expect(response.body).to_not include(invoice3.id)
    expect(response.body).to_not include(invoice5.id)
    expect(response.body).to_not include(invoice6.id)
    expect(response.body).to_not include(invoice7.id)
  end
end
