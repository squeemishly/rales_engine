require 'rails_helper'

RSpec.describe "Merchant API" do

  xit "finds merchants most items" do

    merchant_1, merchant_2 = create_list(:merchant, 2)

    create_list(:item, 10)

    merchant_1.items << Item.take(10)
    merchant_2.items << Item.take(4)

    get "/api/v1/merchants/most_items?quantity=10"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.first["id"]).to eq(merchant_1.id)
    expect(merchants.first["name"]).to eq(merchant_1.name)
  end


end
