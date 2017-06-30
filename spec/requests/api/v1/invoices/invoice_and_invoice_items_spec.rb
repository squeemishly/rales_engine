require 'rails_helper'

describe "Invoice API" do
    it "returns a collection of associated invoice items" do
    invoice_1 = create(:invoice)
    create_list(:invoice_item, 3, invoice: invoice_1)

    get "/api/v1/invoices/#{invoice_1.id}/invoice_items"
    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice.first["quantity"]).to eq(3)
  end
end
