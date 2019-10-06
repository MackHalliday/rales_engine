require 'rails_helper'

describe "Invoice Items Record Endpoints" do
  before :each do
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @customer_4 = create(:customer)

    @merchant_1 = create(:merchant)
      @item_1 = create(:item, merchant: @merchant_1, unit_price: 1000)
      @item_2 = create(:item, merchant: @merchant_1, unit_price: 2000)
      @item_3 = create(:item, merchant: @merchant_1, unit_price: 3000)

    @merchant_2 = create(:merchant)
      @item_4 = create(:item, merchant: @merchant_2, unit_price: 1000)
      @item_5 = create(:item, merchant: @merchant_2, unit_price: 2000)
      @item_6 = create(:item, merchant: @merchant_2, unit_price: 3000)

    @merchant_3 = create(:merchant)
      @item_7 = create(:item, merchant: @merchant_3, unit_price: 1000)
      @item_8 = create(:item, merchant: @merchant_3, unit_price: 2000)
      @item_9 = create(:item, merchant: @merchant_3, unit_price: 3000)

    @merchant_4 = create(:merchant)
      @item_10 = create(:item, merchant: @merchant_4, unit_price: 1000)

    @invoice_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
      @invoice_items_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1, quantity: 1, unit_price: @item_1.unit_price)
      @invoice_items_2 = create(:invoice_item, item: @item_2, invoice: @invoice_1, quantity: 1, unit_price: @item_2.unit_price)
      @invoice_items_3 = create(:invoice_item, item: @item_3, invoice: @invoice_1, quantity: 1, unit_price: @item_3.unit_price)

    @invoice_2 = create(:invoice, customer: @customer_2, merchant: @merchant_2)
      @invoice_items_4 = create(:invoice_item, item: @item_4, invoice: @invoice_2, quantity: 2, unit_price: @item_4.unit_price)
      @invoice_items_5 = create(:invoice_item, item: @item_5, invoice: @invoice_2, quantity: 2, unit_price: @item_5.unit_price)
      @invoice_items_6 = create(:invoice_item, item: @item_6, invoice: @invoice_2, quantity: 2, unit_price: @item_6.unit_price)

    @invoice_3 = create(:invoice, customer: @customer_3, merchant: @merchant_3)
      @invoice_items_7 = create(:invoice_item, item: @item_7, invoice: @invoice_3, quantity: 1, unit_price: @item_7.unit_price)

    @invoice_4 = create(:invoice, customer: @customer_4, merchant: @merchant_4)
      @invoice_items_8 = create(:invoice_item, item: @item_10, invoice: @invoice_4, quantity: 2, unit_price: @item_10.unit_price)

    @invoice_5 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
      @invoice_items_9 = create(:invoice_item, item: @item_1, invoice: @invoice_5, quantity: 1, unit_price: @item_1.unit_price)
      @invoice_items_10 = create(:invoice_item, item: @item_2, invoice: @invoice_5, quantity: 1, unit_price: @item_2.unit_price)

    @invoice_items = [@invoice_items_1, @invoice_items_2,
                      @invoice_items_3, @invoice_items_4,
                      @invoice_items_5, @invoice_items_6,
                      @invoice_items_7, @invoice_items_8,
                      @invoice_items_9, @invoice_items_10]

    @transaction_1 = create(:transaction, invoice: @invoice_1, result: "success")
    @transaction_2 = create(:transaction, invoice: @invoice_2, result: "success")
    @transaction_3 = create(:transaction, invoice: @invoice_3, result: "success", credit_card_number: "1230000000000000")
    @transaction_4 = create(:transaction, invoice: @invoice_4, result: "success", credit_card_number: "1230000000000000")
    @transaction_5 = create(:transaction, invoice: @invoice_5, result: "failed")

    @transactions = [ @transaction_1,
                      @transaction_2,
                      @transaction_3,
                      @transaction_4,
                      @transaction_5 ]

    @expected_attributes = [ "id",
                            "invoice_id",
                            "credit_card_number",
                            "result" ]
  end

  it "can return all transactions" do

    get "/api/v1/transactions"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(5)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@transactions[0].id)
    expect(json_response["data"][0]["attributes"]["credit_card_number"]).to eq(@transactions[0].credit_card_number)
    expect(json_response["data"][0]["attributes"]["invoice_id"]).to eq(@transactions[0].invoice_id)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@transactions[1].id)
    expect(json_response["data"][1]["attributes"]["credit_card_number"]).to eq(@transactions[1].credit_card_number)
    expect(json_response["data"][1]["attributes"]["invoice_id"]).to eq(@transactions[1].invoice_id)
    expect(json_response["data"][4]["attributes"]["id"]).to eq(@transactions[4].id)
    expect(json_response["data"][4]["attributes"]["credit_card_number"]).to eq(@transactions[4].credit_card_number)
    expect(json_response["data"][4]["attributes"]["invoice_id"]).to eq(@transactions[4].invoice_id)
  end

  it "can return a single transaction" do

    get "/api/v1/transactions/#{@transactions[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
    expect(json_response["data"]["attributes"]["id"]).to eq(@transactions[0].id)
    expect(json_response["data"]["attributes"]["credit_card_number"]).to eq(@transactions[0].credit_card_number)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@transactions[0].invoice_id)
    expect(json_response["data"]["attributes"]["result"]).to eq(@transactions[0].result)
  end

  it "can find a single transaction by id" do

    get "/api/v1/transactions/find?id=#{@transactions[0].id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(4)
    expect(json_response["data"]["attributes"]["id"]).to eq(@transactions[0].id)
    expect(json_response["data"]["attributes"]["credit_card_number"]).to eq(@transactions[0].credit_card_number)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@transactions[0].invoice_id)
    expect(json_response["data"]["attributes"]["result"]).to eq(@transactions[0].result)
  end

  it "can find a single transaction by credit_card_number" do

    get "/api/v1/transactions/find?credit_card_number=#{@transactions[0].credit_card_number}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(4)
    expect(json_response["data"]["attributes"]["id"]).to eq(@transactions[0].id)
    expect(json_response["data"]["attributes"]["credit_card_number"]).to eq(@transactions[0].credit_card_number)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@transactions[0].invoice_id)
    expect(json_response["data"]["attributes"]["result"]).to eq(@transactions[0].result)
  end

  it "can find a single invoice by invoice_id" do

    get "/api/v1/transactions/find?invoice_id=#{@invoice_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(4)
    expect(json_response["data"]["attributes"]["id"]).to eq(@transactions[0].id)
    expect(json_response["data"]["attributes"]["credit_card_number"]).to eq(@transactions[0].credit_card_number)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@transactions[0].invoice_id)
    expect(json_response["data"]["attributes"]["result"]).to eq(@transactions[0].result)
  end

  it "can find a single transaction by result" do

    get "/api/v1/transactions/find?result=#{@transactions[4].result}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(4)
    expect(json_response["data"]["attributes"]["id"]).to eq(@transactions[4].id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@transactions[4].invoice_id)
    expect(json_response["data"]["attributes"]["credit_card_number"]).to eq(@transactions[4].credit_card_number)
    expect(json_response["data"]["attributes"]["result"]).to eq(@transactions[4].result)
  end

  it "can find a single transaction by created_at" do

    get "/api/v1/transactions/find?created_at=#{@transactions[0].created_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(4)
    expect(json_response["data"]["attributes"]["id"]).to eq(@transactions[0].id)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@transactions[0].invoice_id)
    expect(json_response["data"]["attributes"]["credit_card_number"]).to eq(@transactions[0].credit_card_number)
    expect(json_response["data"]["attributes"]["result"]).to eq(@transactions[0].result)

  end

  it "can find a single transaction by updated_at" do

    get "/api/v1/transactions/find?updated_at=#{@transactions[0].updated_at}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(4)
    expect(json_response["data"]["attributes"]["id"]).to eq(@transactions[0].id)
    expect(json_response["data"]["attributes"]["credit_card_number"]).to eq(@transactions[0].credit_card_number)
    expect(json_response["data"]["attributes"]["invoice_id"]).to eq(@transactions[0].invoice_id)
    expect(json_response["data"]["attributes"]["result"]).to eq(@transactions[0].result)
  end

  it "can find multiple transactions by credit_card_number" do

    get "/api/v1/transactions/find_all?credit_card_number=1230000000000000"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@transactions_3.id)
    expect(json_response["data"][0]["attributes"]["credit_card_number"]).to eq(@transactions_3.credit_card_number)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(@transactions_4.id)
    expect(json_response["data"][1]["attributes"]["credit_card_number"]).to eq(@transactions_3.credit_card_number)
  end

  it "can find multiple transactions by invoice_id" do

    get "/api/v1/transactions/find_all?invoice_id=#{@invoice_1.id}"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(1)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(@transactions_1.id)
    expect(json_response["data"][0]["attributes"]["invoice_id"]).to eq(@invoice_1.id)
  end

  it "can find multiple transactions by created_at" do

    customer_1 = create(:customer)
    merchant_1 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)

    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer_1)
    transactions_1 = create(:transaction, invoice: invoice_1, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer_1)
    transactions_2 = create(:transaction, invoice: invoice_2, created_at: "Mon, 05 Sep 2019 21:13:03 UTC +00:00")

    invoice_3 = create(:invoice, merchant: merchant_1, customer: customer_1)
    transactions_3 = create(:transaction, invoice: invoice_3, created_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/transactions/find_all?created_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(transactions_1.id)
    expect(json_response["data"][0]["attributes"]["credit_card_number"]).to eq(transactions_1.credit_card_number)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(transactions_3.id)
    expect(json_response["data"][1]["attributes"]["credit_card_number"]).to eq(transactions_1.credit_card_number)
  end

  it "can find multiple transactions by updated_at" do

    customer_1 = create(:customer)
    merchant_1 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)

    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer_1)
    transactions_1 = create(:transaction, invoice: invoice_1, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer_1)
    transactions_2 = create(:transaction, invoice: invoice_2, updated_at: "Mon, 05 Sep 2019 21:13:03 UTC +00:00")

    invoice_3 = create(:invoice, merchant: merchant_1, customer: customer_1)
    transactions_3 = create(:transaction, invoice: invoice_3, updated_at: "Fri, 04 Oct 2019 21:13:03 UTC +00:00")

    get "/api/v1/transactions/find_all?updated_at=Fri, 04 Oct 2019 21:13:03 UTC +00:00"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(2)
    expect(json_response["data"][0]["attributes"]["id"]).to eq(transactions_1.id)
    expect(json_response["data"][0]["attributes"]["credit_card_number"]).to eq(transactions_1.credit_card_number)
    expect(json_response["data"][1]["attributes"]["id"]).to eq(transactions_3.id)
    expect(json_response["data"][1]["attributes"]["credit_card_number"]).to eq(transactions_1.credit_card_number)
  end

  it "can return a random invoice" do

    get "/api/v1/transactions/random"

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response["data"].count).to eq(3)
    expect(json_response["data"].keys).to eq(["id", "type", "attributes"])
    expect(json_response["data"]["attributes"].keys).to eq(@expected_attributes)
  end
end
