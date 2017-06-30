require 'rails_helper'

RSpec.describe "can find items" do
  context "it finds a single item" do
    subject(:item) { create(:item) }
    subject(:item2) { create(:item) }

    it "by name" do
      get "/api/v1/items/find?name=#{item.name}"
      parsed_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed_item["name"]).to eq item.name
      expect(parsed_item["name"]).to_not eq item2.name
    end

    it "by id" do
      get "/api/v1/items/find?id=#{item.id}"
      parsed_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed_item["id"]).to eq item.id
      expect(parsed_item["id"]).to_not eq item2.id
    end

    it "by description" do
      item = create(:item, description: "simply the best")

      get "/api/v1/items/find?description=#{item.description}"
      parsed_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed_item["description"]).to eq item.description
      expect(parsed_item["description"]).to_not eq item2.description
    end

    it "by unit_price" do
      item = create(:item, unit_price: "5434")

      get "/api/v1/items/find?unit_price=#{item.unit_price}"
      parsed_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed_item["unit_price"]).to eq item.unit_price
      expect(parsed_item["unit_price"]).to_not eq item2.unit_price
    end

    it "by merchant" do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      get "/api/v1/items/find?merchant_id=#{item.merchant_id}"
      parsed_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(parsed_item["merchant_id"]).to eq item.merchant_id
      expect(parsed_item["merchant_id"]).to_not eq item2.merchant_id
    end
  end

  context "as a list of all items that meet a condition" do
    it "description" do
      create_list(:item, 3)
      item1 = Item.first
      item2 = create(:item, description: "Potion of Extreme Height")

      get "/api/v1/items/find_all?description=#{item1.description}"
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first["description"]).to eq item1.description
      expect(response.body).to_not include item2.description
    end

    it "name" do
      create_list(:item, 3)
      item1 = Item.first
      item2 = Item.last

      get "/api/v1/items/find_all?name=#{item1.name}"
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first["name"]).to eq item1.name
      expect(response.body).to_not include item2.name
    end
  end
end
