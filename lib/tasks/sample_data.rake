namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_main_user
  end
end

def make_main_user
  user = User.create!(name: "Example User", email: "user@example.com")

  3.times do |n|
    organization = Organization.create!(name: "Example Organization #{n}")

    membership = user.organization_memberships.build
    membership.organization = organization
    membership.save!

    3.times do |m|
      organization.groups.create!(name: "Example Group #{3*n+m+1}")
    end
  end
end