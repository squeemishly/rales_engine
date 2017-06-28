require "rails_helper"

describe "Customers API" do

  before :each do
    @customer_1 = create(:customer, first_name: "Beth", last_name: "Knight", id: 1)
    @customer_2 = create(:customer, first_name: "Squee", last_name: "Mueller", id: 2)
    @customer_3 = create(:customer, first_name: "Kasey", last_name: "Adwon", id: 3)

  end

  it "finds all customers by id" do

    get "/api/v1/customers/find_all?id=#{@customer_1.id}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.first["id"]).to eq(@customer_1.id)
  end

  it "finds all customers by first_name" do

    get "/api/v1/customers/find_all?first_name=#{@customer_3.first_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.first["first_name"]).to eq(@customer_3.first_name)
  end

  it "finds all customers by last_name" do

    get "/api/v1/customers/find_all?last_name=#{@customer_3.last_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.first["last_name"]).to eq(@customer_3.last_name)
  end


  it "finds a customer by their id" do

    get "/api/v1/customers/find?id=#{@customer_1.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(@customer_1.id)
  end

  it "finds a customer by their first_name" do

    get "/api/v1/customers/find?first_name=#{@customer_2.first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(@customer_2.first_name)
  end


  it "finds a customer by their last_name" do

    get "/api/v1/customers/find?last_name=#{@customer_2.last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
  expect(customer["last_name"]).to eq(@customer_2.last_name)
  end
end
