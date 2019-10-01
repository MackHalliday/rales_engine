
namespace :import do
  desc "Import user from csv"
  task users: :environment do
    CSV.foreach("users.cvs")
  end
end
