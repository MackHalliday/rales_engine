
  desc "Import user from csv"
    task customers: :environment do
      counters = 0
      CSV.foreach("db/data/customers.csv", headers: true) do |row|
        customer = Customer.create!(row.to_h)
        counters += 1 if customer.persisted?
    end
    puts "Imported #{counters} customers"
  end
