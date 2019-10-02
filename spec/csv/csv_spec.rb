require 'rails_helper'

describe "CSV files" do
  it "can import CSV files" do
    binding.pry
    expect(Customer.first.first_name).to eq("Joey")
    expect(Customer.first.last_name).to eq("Ondricka")
    expect(Customer.first.created_at).to eq("2012-03-27 14:54:09 UTC")
    expect(Customer.first.updated_at).to eq("2012-03-27 14:54:09 UTC")
  end
end
