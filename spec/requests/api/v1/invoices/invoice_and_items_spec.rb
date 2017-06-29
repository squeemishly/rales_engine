require 'rails_helper'

describe "Invoices API" do
  xit "returns a collection of associated items" do
    invoice_1 = create(:invoice)
    create_list(:item, 3, invoice: invoice_1)

    get "/api/v1/invoices/#{invoice_1.id}/items"
    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.first["result"]).to eq("success")
  end
end
