require 'rails_helper'

RSpec.describe "finds a random item" do
  it "when you search for a random item" do
    create_list(:item, 10)

    get '/api/v1/items/random.json'
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item).to have_key "id"
    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "unit_price"
    expect(item).to have_key "merchant_id"
  end
end
