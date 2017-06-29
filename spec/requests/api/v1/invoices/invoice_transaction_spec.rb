require 'rails_helper'

describe "Invoice API" do
    it "returns a collection of associated transactions" do
    invoice_1 = create(:invoice)
    trans_1 = create(:transaction, invoice: invoice_1)
    trans_2 = create(:transaction, invoice: invoice_1)

    get "/api/v1/invoices/#{invoice_1.id}/transactions"
    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.first["id"]).to eq(trans_1.id)
    expect(transactions.last["id"]).to eq(trans_2.id)
    expect(transactions.first["credit_card_number"]).to eq(trans_1.credit_card_number)
    expect(transactions.last["credit_card_number"]).to eq(trans_2.credit_card_number)
    expect(transactions.first["invoice_id"]).to eq(invoice_1.id)
    expect(transactions.last["invoice_id"]).to eq(invoice_1.id)
  end
end
