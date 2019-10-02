
namespace :import do
  desc "Import customers from csv"
    task customers: :environment do
      CSV.foreach("db/data/customers.csv", headers: true) do |row|
        customer = Customer.create!(row.to_h)
    end
  end

  desc "Import merchants from csv"
    task merchants: :environment do
      CSV.foreach("db/data/merchants.csv", headers: true) do |row|
        merchant = Merchant.create!(row.to_h)
    end
  end

  desc "Import items from csv"
    task items: :environment do
      CSV.foreach("db/data/items.csv", headers: true) do |row|
        item = Item.create!(row.to_h)
    end
  end

  desc "Import invoices from csv"
    task invoices: :environment do
      CSV.foreach("db/data/invoices.csv", headers: true) do |row|
        invoice = Invoice.create!(row.to_h)
    end
  end

  desc "Import transactions from csv"
    task transactions: :environment do
      CSV.foreach("db/data/transactions.csv", headers: true) do |row|
        transaction = Transaction.create!(row.to_h)
    end
  end

  desc "Import invoice items from csv"
    task invoice_items: :environment do
      CSV.foreach("db/data/invoice_items.csv", headers: true) do |row|
        invoice_items = InvoiceItem.create!(row.to_h)
    end
  end
end
