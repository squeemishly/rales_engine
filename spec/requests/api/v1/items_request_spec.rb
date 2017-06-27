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
    expect(item["name"]).to be_a String
    expect(item["description"]).to be_a String
  end
end
