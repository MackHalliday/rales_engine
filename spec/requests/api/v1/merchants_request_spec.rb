require 'rails_helper'

describe "Merchant Record Endpoints" do
  before :each do
    merchants = create_list(:merchant, 5)
  end

  it "can return all merchants" do

    get "/api/v1/merchants"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
  end

  it "can return a single merchant" do
  end

  it "can find a single merchant" do
  end

  it "can find multipl merchants" do
  end

  it "can return multiple merchants" do
  end
end
