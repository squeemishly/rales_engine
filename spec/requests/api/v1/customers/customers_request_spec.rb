require 'rails_helper'


describe "Customers API" do
  it "sends a list of customers" do

    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)
    customer = customers.first

    expect(customers.count).to eq(3)
    expect(customer).to have_key("first_name")
    expect(customer["first_name"]).to be_a String
    expect(customer).to have_key("last_name")
    expect(customer["last_name"]).to be_a String
  end

  it "can get one customer by its id" do

      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"

      expect(response).to be_success

      result = JSON.parse(response.body)

      expect(result["first_name"]).to eq(customer.first_name)
      expect(result["first_name"]).to be_a String
      expect(result["last_name"]).to eq(customer.last_name)
      expect(result["last_name"]).to be_a String
    end
end
