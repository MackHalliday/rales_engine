require 'rails_helper'

describe "Merchant Record Endpoints" do
  before :each do
    @merchants = create_list(:merchant, 5)
  end

  it "can return all merchants" do

    get "/api/v1/merchants"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    merchant_1 = json_response["data"].first

    expect(json_response["data"].count).to eq(5)
    expect(merchant_1["attributes"]["id"]).to eq(@merchants.first.id)
    expect(merchant_1["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can return a single merchant" do

    get "/api/v1/merchants/#{@merchants.first.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants.first.id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant" do
  end

  it "can find multipl merchants" do
  end

  it "can return multiple merchants" do
  end
end
