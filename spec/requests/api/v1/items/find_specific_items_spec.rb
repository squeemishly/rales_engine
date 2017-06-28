require 'rails_helper'

RSpec.describe "can find items" do
  it "as a single item at a time" do
    item = create(:item)
    item2 = create(:item)

    get "/api/v1/items/find?name=#{item.name}"
    parsed_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(parsed_item["name"]).to eq item.name
    expect(response.body).to_not include item2.name
  end

  it "as a list of all items that meet a condition" do
    create_list(:item, 3)
    item1 = Item.first
    item2 = create(:item, description: "Potion of Extreme Height")

    get "/api/v1/items/find_all?description=#{item1.description}"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.first["description"]).to eq item1.description
    expect(response.body).to_not include item2.description
  end
end
