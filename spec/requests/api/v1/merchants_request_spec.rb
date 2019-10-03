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

  it "can find a single merchant by id" do
    # binding.pry
    get "/api/v1/merchants/find?id=#{@merchants.first.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants.first.id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant by name" do
    # skip
    get "/api/v1/merchants/find?name=#{@merchants.first.name}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants.first.id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant by created_at" do

    get "/api/v1/merchants/find?created_at=#{@merchants.first.created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants.first.id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find a single merchant by updated_at" do

    get "/api/v1/merchants/find?updated_at=#{@merchants.first.updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@merchants.first.id)
    expect(json_response["data"]["attributes"]["name"]).to eq(@merchants.first.name)
  end

  it "can find multiple merchants by name" do

    merchant_1 = create(:merchant, name: "adam")
    merchant_2 = create(:merchant, name: "adam")
    merchant_3 = create(:merchant, name: "chuck")

    get "/api/v1/merchants/find_all?name=adam"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(merchant_1.id)
    expect(json_response["data"][0]["attributes"]["name"]).to eq(merchant_1.name)

    expect(json_response["data"][1]["attributes"]["id"]).to eq(merchant_2.id)
    expect(json_response["data"][1]["attributes"]["name"]).to eq(merchant_2.name)
  end
end
