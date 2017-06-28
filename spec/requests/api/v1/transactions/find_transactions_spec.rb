require 'rails_helper'

describe "Transactions API" do

  before :each do
    @transaction_1 = create(:transaction, id:1)
    @transaction_2 = create(:transaction, id: 2)
    @transaction_3 = create(:transaction, id: 3)
  end

  it "finds all transactions by an id" do

    get "/api/v1/transactions/find_all?id=#{@transaction_1.id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.first["id"]).to eq(@transaction_1.id)
  end

  it "finds transaction by an id" do

    get "/api/v1/transactions/find?id=#{@transaction_2.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(@transaction_2.id)
  end

  it "finds all transactions by a credit card number" do

    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction_1.credit_card_number}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.first["credit_card_number"]).to eq(@transaction_1.credit_card_number)
  end

  it "finds transaction by an credit card number" do

    get "/api/v1/transactions/find?credit_card_number=#{@transaction_2.credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["credit_card_number"]).to eq(@transaction_2.credit_card_number)
  end

  it "finds all transactions by a result" do

    get "/api/v1/transactions/find_all?result=#{@transaction_1.result}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.first["result"]).to eq(@transaction_1.result)
  end

  it "finds transaction by an result" do

    get "/api/v1/transactions/find?result=#{@transaction_2.result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["result"]).to eq(@transaction_2.result)
    end
  end
