require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "belongs to an invoice" do
    transaction = create(:transaction)
    expect(transaction).to respond_to(:invoice)
  end

  it "has the appropriate attributes" do
    transaction = create(:transaction)
    expect(transaction.attributes).to include "credit_card_number"
    expect(transaction.attributes).to include "id"
    expect(transaction.attributes).to include "invoice_id"
    expect(transaction.attributes).to include "result"
  end
end
