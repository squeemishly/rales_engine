require 'rails_helper'

describe "Transaction API" do
  it "returns an invoice associated with an transaction" do
    invoice_1 = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice_1)

    get "/api/v1/transactions/#{transaction_1.id}/invoice"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(invoice_1.id)
  end
end
