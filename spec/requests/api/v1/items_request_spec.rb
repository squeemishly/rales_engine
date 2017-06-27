require 'rails_helper'

RSpec.describe "Items requests" do
  it "can see a list of all items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success
  end
end
