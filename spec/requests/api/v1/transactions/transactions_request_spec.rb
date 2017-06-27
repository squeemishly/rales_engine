require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_success

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(transactions.count).to eq(3)
    expect(transaction).to have_key("credit_card_number")
    expect(transaction["credit_card_number"]).to be_a String
    expect(transaction).to have_key("result")
    expect(transaction["result"]).to be_a String
  end

  it "can get one transaction by its id" do
    transaction = create(:transaction)

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_success

    result = JSON.parse(response.body)

    expect(result["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(result["result"]).to be_a String 
  end
end
