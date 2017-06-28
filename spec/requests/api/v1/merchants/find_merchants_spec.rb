require "rails_helper"

describe "Merchants API" do

  before :each do
    @merchant_1 = create(:merchant, name: "Beth", id: 1)
    @merchant_2 = create(:merchant, name: "Squee", id: 2)
    @merchant_3 = create(:merchant, name: "Peggy", id: 3)
  end

  it "finds all merchants by id" do

    get "/api/v1/merchants/find_all?id=#{@merchant_1.id}"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.first["id"]).to eq(@merchant_1.id)
  end

  it "finds all merchants by name" do

    get "/api/v1/merchants/find_all?name=#{@merchant_3.name}"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.first["name"]).to eq(@merchant_3.name)
  end

  it "finds a merchant by their id" do

    get "/api/v1/merchants/find?id=#{@merchant_1.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(@merchant_1.id)
  end

  it "finds a merchant by their name" do

    get "/api/v1/merchants/find?name=#{@merchant_2.name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(@merchant_2.name)
  end
end
