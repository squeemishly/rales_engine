require 'rails_helper'

describe "Invoices API" do
  it "returns a collection of associated items" do
    invoice_1 = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    create(:invoice_item, invoice: invoice_1, item: item_1)
    create(:invoice_item, invoice: invoice_1, item: item_1)
    create(:invoice_item, invoice: invoice_1, item: item_2)

    get "/api/v1/invoices/#{invoice_1.id}/items"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.first["id"]).to eq(item_1.id)
    expect(items.last["id"]).to eq(item_2.id)
  end
end
