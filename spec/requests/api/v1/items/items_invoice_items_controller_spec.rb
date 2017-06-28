require 'rails_helper'

describe "Item API" do

  it "finds invoice items belonging to an item" do
    item_1 = create(:item)
    invoices = create_list(:invoice_item, 3, item: item_1)

    get "/api/v1/items/#{item_1.id}/invoice_items"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
    expect(invoice.first["id"]).to eq(invoices[0].id)

  end


end
