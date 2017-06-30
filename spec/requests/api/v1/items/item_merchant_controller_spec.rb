require 'rails_helper'

describe "Item API" do

  it "finds a merchant associated with an item" do
    merchant_1 = create(:merchant)
    item_1 = create(:item, merchant: merchant_1)

    get "/api/v1/items/#{item_1.id}/merchant"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchant_1.id)
  end
end
