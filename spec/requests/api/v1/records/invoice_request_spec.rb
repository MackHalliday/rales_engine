require 'rails_helper'

describe "Invoices Record Endpoints" do
  before :each do
    @merchant_1 = create(:merchant, id: 100)
    @merchant_2 = create(:merchant, id: 200)

    @customer_1 = create(:customer, id: 300)
    @customer_2 = create(:customer, id: 400)

    @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1 )
    @invoice_2 = create(:invoice, merchant: @merchant_1, customer: @customer_1 )

    @invoice_3 = create(:invoice, merchant: @merchant_2, customer: @customer_2 )
    @invoice_4 = create(:invoice, merchant: @merchant_2, customer: @customer_2 )

    @invoice_5 = create(:invoice, merchant: @merchant_1, customer: @customer_2 )
    @invoice_6 = create(:invoice, merchant: @merchant_1, customer: @customer_2 )

    @invoice_7 = create(:invoice, merchant: @merchant_2, customer: @customer_1 )
    @invoice_8 = create(:invoice, merchant: @merchant_2, customer: @customer_1 )

    @invoice_9 = create(:invoice, merchant: @merchant_2, customer: @customer_2 )
    @invoice_10 = create(:invoice, merchant: @merchant_2, customer: @customer_2 )

    @invoices = [ @invoice_1, @invoice_2,
                  @invoice_3, @invoice_4,
                  @invoice_5, @invoice_6,
                  @invoice_7, @invoice_8,
                  @invoice_9, @invoice_10]

    @expected_attributes = [ "id",
                            "merchant_id",
                            "customer_id",
                            "status"]
  end

  it "can return all invoices" do

    get "/api/v1/invoices"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(10)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoices[0].id)
    expect(json_response["data"][0]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"][0]["attributes"]["customer_id"]).to eq(@invoices[0].customer_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoices[1].id)
    expect(json_response["data"][1]["attributes"]["merchant_id"]).to eq(@invoices[1].merchant_id)
    expect(json_response["data"][1]["attributes"]["customer_id"]).to eq(@invoices[1].customer_id)
  end

  it "can return a single invoice" do

    get "/api/v1/invoices/#{@invoices[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoices[0].id)
    expect(json_response["data"]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"]["attributes"]["customer_id"]).to eq(@invoices[0].customer_id)
    expect(json_response["data"]["attributes"]["status"]).to eq(@invoices[0].status)
  end

  it "can find a single invoice by id" do
    get "/api/v1/invoices/find?id=#{@invoices[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoices[0].id)
    expect(json_response["data"]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"]["attributes"]["customer_id"]).to eq(@invoices[0].customer_id)
    expect(json_response["data"]["attributes"]["status"]).to eq(@invoices[0].status)
  end

  it "can find a single invoice by merchant_id" do

    get "/api/v1/invoices/find?merchant_id=#{@merchant_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)


    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoice_1.id)
    expect(json_response["data"]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"]["attributes"]["customer_id"]).to eq(@invoices[0].customer_id)
    expect(json_response["data"]["attributes"]["status"]).to eq(@invoices[0].status)
  end

  it "can find a single invoice by customer_id" do

    get "/api/v1/invoices/find?customer_id=#{@invoices[0].customer_id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoices[0].id)
    expect(json_response["data"]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"]["attributes"]["customer_id"]).to eq(@invoices[0].customer_id)
    expect(json_response["data"]["attributes"]["status"]).to eq(@invoices[0].status)
  end

  it "can find a single invoice by status" do

    get "/api/v1/invoices/find?status=#{@invoices[0].status}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoices[0].id)
    expect(json_response["data"]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"]["attributes"]["status"]).to eq(@invoices[0].status)
  end

  it "can find a single invoice by created_at" do

    get "/api/v1/invoices/find?created_at=#{@invoices[0].created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["id"]).to eq(@invoices[0].id)
    expect(json_response["data"]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"]["attributes"]["customer_id"]).to eq(@invoices[0].customer_id)
    expect(json_response["data"]["attributes"]["status"]).to eq(@invoices[0].status)
  end

  it "can find a single invoice by updated_at" do

    get "/api/v1/invoices/find?updated_at=#{@invoices[0].updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"]["merchant_id"]).to eq(@invoices[0].merchant_id)
    expect(json_response["data"]["attributes"]["customer_id"]).to eq(@invoices[0].customer_id)
    expect(json_response["data"]["attributes"]["status"]).to eq(@invoices[0].status)
  end

  it "can find multiple invoices by merchant_id" do

    get "/api/v1/invoices/find_all?merchant_id=#{@merchant_2.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(6)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_3.id)
    expect(json_response["data"][0]["attributes"]["merchant_id"]).to eq(@merchant_2.id)
    expect(json_response["data"][5]["attributes"]["id"]).to eq(@invoice_10.id)
    expect(json_response["data"][5]["attributes"]["merchant_id"]).to eq(@merchant_2.id)
  end

  it "can find multiple invoices by customer_id" do

    get "/api/v1/invoices/find_all?customer_id=#{@customer_2.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(6)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_3.id)
    expect(json_response["data"][0]["attributes"]["customer_id"]).to eq(@invoice_3.customer_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoice_4.id)
    expect(json_response["data"][1]["attributes"]["customer_id"]).to eq(@invoice_4.customer_id)
  end

  it "can find multiple Invoices by status" do

    get "/api/v1/invoices/find_all?status=shipped"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(10)

    expect(json_response["data"][0]["attributes"]["id"]).to eq(@invoice_1.id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@invoice_2.id)
    expect(json_response["data"][2]["attributes"]["id"]).to eq(@invoice_3.id)
    expect(json_response["data"][3]["attributes"]["id"]).to eq(@invoice_4.id)
    expect(json_response["data"][4]["attributes"]["id"]).to eq(@invoice_5.id)
    expect(json_response["data"][5]["attributes"]["id"]).to eq(@invoice_6.id)
    expect(json_response["data"][6]["attributes"]["id"]).to eq(@invoice_7.id)
    expect(json_response["data"][7]["attributes"]["id"]).to eq(@invoice_8.id)
    expect(json_response["data"][8]["attributes"]["id"]).to eq(@invoice_9.id)
    expect(json_response["data"][9]["attributes"]["id"]).to eq(@invoice_10.id)

    expect(json_response["data"][0]["attributes"]["status"]).to eq(@invoice_1.status)
    expect(json_response["data"][1]["attributes"]["status"]).to eq(@invoice_2.status)
    expect(json_response["data"][2]["attributes"]["status"]).to eq(@invoice_3.status)
    expect(json_response["data"][3]["attributes"]["status"]).to eq(@invoice_4.status)
    expect(json_response["data"][4]["attributes"]["status"]).to eq(@invoice_5.status)
    expect(json_response["data"][5]["attributes"]["status"]).to eq(@invoice_6.status)
    expect(json_response["data"][6]["attributes"]["status"]).to eq(@invoice_7.status)
    expect(json_response["data"][7]["attributes"]["status"]).to eq(@invoice_8.status)
    expect(json_response["data"][8]["attributes"]["status"]).to eq(@invoice_9.status)
    expect(json_response["data"][9]["attributes"]["status"]).to eq(@invoice_10.status)
  end

  it "can find multiple invoices by created_at" do

    customer_1 = create(:customer)
    merchant_1 = create(:merchant)

    invoice_1 = create(:invoice, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1, customer: customer_1)
    invoice_2 = create(:invoice, created_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1, customer: customer_1)
    invoice_3 = create(:invoice, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1, customer: customer_1)

    get "/api/v1/invoices/find_all?created_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(invoice_1.id)
    expect(json_response["data"][0]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(invoice_3.id)
    expect(json_response["data"][1]["attributes"]["merchant_id"]).to eq(invoice_3.merchant_id)
  end

  it "can find multiple invoices by updated_at" do

    customer_1 = create(:customer)
    merchant_1 = create(:merchant)

    invoice_1 = create(:invoice, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1, customer: customer_1)
    invoice_2 = create(:invoice, updated_at: "Fri, 05 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1, customer: customer_1)
    invoice_3 = create(:invoice, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00", merchant: merchant_1, customer: customer_1)

    get "/api/v1/invoices/find_all?updated_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(invoice_1.id)
    expect(json_response["data"][0]["attributes"]["merchant_id"]).to eq(invoice_1.merchant_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(invoice_3.id)
    expect(json_response["data"][1]["attributes"]["merchant_id"]).to eq(invoice_3.merchant_id)
  end

  it "can return a random invoice" do

    get "/api/v1/invoices/random"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"].keys).to eq(["id", "type", "attributes"])
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
  end
end
