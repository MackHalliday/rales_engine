
  desc "Import customers from csv"
    task customers: :environment do
      counters = 0
      CSV.foreach("db/data/customers.csv", headers: true) do |row|
        binding.pry
        customer = Customer.create!(row.to_h)
        counters += 1 if customer.persisted?
    end
    puts "Imported #{counters} customers"
  end

  desc "Import invoice items from csv"
    task invoice_items: :environment do
      counters = 0
      CSV.foreach("db/data/invoice_items.csv", headers: true) do |row|
        invoice_items = InvoiceItem.create!(row.to_h)
        counters += 1 if invoice_items.persisted?
    end
    puts "Imported #{counters} invoice items"
  end
