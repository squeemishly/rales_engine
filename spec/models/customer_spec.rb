require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "has many invoices" do
    customer = create(:customer)
    expect(customer).to respond_to(:invoices)
  end

  it "has the appropriate fields" do
    customer = create(:customer)
    expect(customer.first_name).to eq "Mia"
    expect(customer.last_name).to eq "Jaeger"
  end
end
