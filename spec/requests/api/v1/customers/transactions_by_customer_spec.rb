require 'rails_helper'

RSpec.describe "a list of transactions" do
  it "for a particular customer" do
    customer1 = create(:customer)
    customer2 = create(:customer)

    invoice1 = create(:invoice, customer_id: customer1.id, id: 100000000)
    invoice2 = create(:invoice, customer_id: customer1.id, id: 200000000)
    invoice3 = create(:invoice, customer_id: customer2.id, id: 300000000)

    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    transaction3 = create(:transaction, invoice_id: invoice3.id)

    get "/api/v1/customers/#{customer1.id}/transactions"
    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.first).to have_key "credit_card_number"
    expect(response.body).to include invoice1.id.to_s
    expect(response.body).to include invoice2.id.to_s
    expect(response.body).to_not include invoice3.id.to_s
  end
end
