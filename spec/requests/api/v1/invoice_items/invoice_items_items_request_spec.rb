require 'rails_helper'

describe "Invoice Items API" do
  it "returns an invoice associated with an invoice item" do
    invoice_1 = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice_1)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(invoice_1.id)
  end
end
