require 'rails_helper'

RSpec.describe "Items requests" do
  it "can see a list of all items" do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to be 3
    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "unit_price"
    expect(item).to have_key "merchant_id"
    expect(item["name"]).to be_a String
    expect(item["description"]).to be_a String
    expect(item["unit_price"]).to be_a Float
    expect(item["merchant_id"]).to be_a Integer
  end

  it "can find a single item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    item_parsed = JSON.parse(response.body)

    expect(response).to be_success
    expect(item_parsed["id"]).to eq item.id
    expect(item_parsed["name"]).to eq item.name
    expect(item_parsed["description"]).to eq item.description
    expect(item_parsed["unit_price"]).to eq item.unit_price
    expect(item_parsed["merchant_id"]).to eq item.merchant_id
    expect(item_parsed).to have_key "name"
    expect(item_parsed).to have_key "description"
    expect(item_parsed["name"]).to be_a String
    expect(item_parsed["description"]).to be_a String
  end
end
