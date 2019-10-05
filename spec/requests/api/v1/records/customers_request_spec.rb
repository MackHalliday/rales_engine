require 'rails_helper'

describe "Customer Record Endpoints" do
  before :each do
    @customers = create_list(:customer, 5)
  end

  it "can return all customers" do

    get "/api/v1/customers"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(5)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@customers[0].id)
    expect(json_response["data"][0]["attributes"]["first_name"]).to eq(@customers[0].first_name)
    expect(json_response["data"][0]["attributes"]["last_name"]).to eq(@customers[0].last_name)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@customers[1].id)
    expect(json_response["data"][1]["attributes"]["first_name"]).to eq(@customers[1].first_name)
    expect(json_response["data"][1]["attributes"]["last_name"]).to eq(@customers[1].last_name)
  end

  it "can return a single customer" do

    get "/api/v1/customers/#{@customers[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"].keys).to eq(["id", "first_name", "last_name"])
    expect(json_response["data"]["attributes"]["id"]).to eq(@customers[0].id)
    expect(json_response["data"]["attributes"]["first_name"]).to eq(@customers[0].first_name)
    expect(json_response["data"]["attributes"]["last_name"]).to eq(@customers[0].last_name)
  end

  it "can find a single customer by id" do
    get "/api/v1/customers/find?id=#{@customers[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@customers[0].id)
    expect(json_response["data"]["attributes"]["first_name"]).to eq(@customers[0].first_name)
    expect(json_response["data"]["attributes"]["last_name"]).to eq(@customers[0].last_name)
  end

  it "can find a single customer by first_name" do

    get "/api/v1/customers/find?first_name=#{@customers[0].first_name}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@customers[0].id)
    expect(json_response["data"]["attributes"]["first_name"]).to eq(@customers[0].first_name)
    expect(json_response["data"]["attributes"]["last_name"]).to eq(@customers[0].last_name)
  end

  it "can find a single customer by last_name" do

    get "/api/v1/customers/find?last_name=#{@customers[0].last_name}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@customers[0].id)
    expect(json_response["data"]["attributes"]["first_name"]).to eq(@customers[0].first_name)
    expect(json_response["data"]["attributes"]["last_name"]).to eq(@customers[0].last_name)
  end

  it "can find a single customer by created_at" do

    get "/api/v1/customers/find?created_at=#{@customers[0].created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@customers[0].id)
    expect(json_response["data"]["attributes"]["first_name"]).to eq(@customers[0].first_name)
    expect(json_response["data"]["attributes"]["last_name"]).to eq(@customers[0].last_name)
  end

  it "can find a single customer by updated_at" do

    get "/api/v1/customers/find?updated_at=#{@customers[0].updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@customers[0].id)
    expect(json_response["data"]["attributes"]["first_name"]).to eq(@customers[0].first_name)
    expect(json_response["data"]["attributes"]["last_name"]).to eq(@customers[0].last_name)
  end

  it "can find multiple customers by first_name" do

    customer_1 = create(:customer, first_name: "Adam")
    customer_2 = create(:customer, first_name: "Adam")
    customer_3 = create(:customer, first_name: "Chuck")

    get "/api/v1/customers/find_all?first_name=Adam"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(json_response["data"][1]["attributes"]["first_name"]).to eq(customer_2.first_name)
  end

  it "can find multiple customers by last_name" do

    customer_1 = create(:customer, last_name: "Smith")
    customer_2 = create(:customer, last_name: "Smith")
    customer_3 = create(:customer, last_name: "Johnson")

    get "/api/v1/customers/find_all?last_name=Smith"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["last_name"]).to eq(customer_1.last_name)
    expect(json_response["data"][1]["attributes"]["last_name"]).to eq(customer_2.last_name)
  end

  it "can find multiple customers by created_at" do

    customer_1 = create(:customer, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")
    customer_2 = create(:customer, created_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00")
    customer_3 = create(:customer, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/customers/find_all?created_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(customer_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(customer_3.id)
    expect(json_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(json_response["data"][1]["attributes"]["first_name"]).to eq(customer_3.first_name)
  end

  it "can find multiple customers by updated_at" do
    customer_1 = create(:customer, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")
    customer_2 = create(:customer, updated_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00")
    customer_3 = create(:customer, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/customers/find_all?updated_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(customer_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(customer_3.id)
    expect(json_response["data"][0]["attributes"]["first_name"]).to eq(customer_1.first_name)
    expect(json_response["data"][1]["attributes"]["first_name"]).to eq(customer_3.first_name)
  end

  it "can return a random customer" do

    get "/api/v1/customers/random"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"].keys).to eq(["id", "type", "attributes"])
    expect(json_response["data"]["attributes"].keys).to eq(["id", "first_name", "last_name"])
  end
end
