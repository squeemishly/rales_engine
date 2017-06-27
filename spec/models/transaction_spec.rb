require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "belongs to an invoice" do
    transaction = create(:transaction)
      expect(transaction).to respond_to(:invoice)
  end
end
