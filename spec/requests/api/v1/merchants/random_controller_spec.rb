require 'rails_helper'

describe "Merchants API" do

  xit "can find a random merchant" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    get "/api/v1/merchants/random"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(merchant_1.id)
  end
end
