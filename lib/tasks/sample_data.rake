namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User", email: "example@railstutorial.org")
  end
end