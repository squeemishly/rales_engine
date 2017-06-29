require 'rails_helper'

describe "Invoice API" do
    xit "returns a collection of associated transactions" do
    invoice_1 = create(:invoice)
    transactions_1 = create(:transaction, invoice: invoice_1)

    get "/api/v1/invoices/#{invoice_1.id}/transactions"
    expect(response).to be_success

    transactions = JSON.parse(response.body)
    expect(transactions["result"]).to eq("success")
  end
end
