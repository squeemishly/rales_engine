require 'rails_helper'

RSpec.describe "find invoice items" do
  it "as a single item - unit_price" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item1.unit_price}"
    parsed_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_invoice_item["unit_price"]).to eq invoice_item1.unit_price
    expect(parsed_invoice_item["id"]).to eq invoice_item1.id
    expect(parsed_invoice_item["id"]).to_not eq invoice_item2.id
  end

  it "as a single item - id" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item1.id}"
    parsed_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_invoice_item["id"]).to eq invoice_item1.id
    expect(parsed_invoice_item["id"]).to_not eq invoice_item2.id
  end

  it "as a single item - quantity" do
    invoice_item1 = create(:invoice_item, quantity: 6)
    invoice_item2 = create(:invoice_item)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item1.quantity}"
    parsed_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_invoice_item["quantity"]).to eq invoice_item1.quantity
    expect(parsed_invoice_item["id"]).to eq invoice_item1.id
    expect(parsed_invoice_item["id"]).to_not eq invoice_item2.id
  end

  it "as a single item - invoice_id" do
    invoice = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice_id: invoice.id)
    invoice_item2 = create(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item1.invoice_id}"
    parsed_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_invoice_item["invoice_id"]).to eq invoice_item1.invoice_id
    expect(parsed_invoice_item["id"]).to eq invoice_item1.id
    expect(parsed_invoice_item["id"]).to_not eq invoice_item2.id
  end

  it "as a single item - item_id" do
    item = create(:item)
    invoice_item1 = create(:invoice_item, item_id: item.id)
    invoice_item2 = create(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item1.item_id}"
    parsed_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_invoice_item["item_id"]).to eq invoice_item1.item_id
    expect(parsed_invoice_item["id"]).to eq invoice_item1.id
    expect(parsed_invoice_item["id"]).to_not eq invoice_item2.id
  end

  it "as a group of items" do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice_item3 = create(:invoice_item, quantity: 6)

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item1.quantity}"
    parsed_response = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_response.first["quantity"]).to eq invoice_item1.quantity
  end
end
