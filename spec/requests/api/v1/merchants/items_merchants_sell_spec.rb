require 'rails_helper'

RSpec.describe "a list of items can be found" do
  it "when you search for merchants by id and ask for their items" do
    merchant1 = create(:merchants_with_items)
    merchant2 = create(:merchants_with_items)

    get "/api/v1/merchants/#{merchant1.id}/items"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.body).to include(merchant1.items.first.name)
    expect(response.body).to include(merchant1.items.last.name)
    expect(response.body).to_not include(merchant2.items.first.name)
    expect(response.body).to_not include(merchant2.items.last.name)
  end
end
