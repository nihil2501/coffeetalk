FactoryGirl.define do
  factory :user do
    name "Example User"
    email "user@example.com"

    factory :user_with_organizations do
      organizations { FactoryGirl.create_list(:organization_with_groups, 3) }
    end
  end

  factory :organization do
    sequence(:name) { |n| "Example Organization #{n}" }

    factory :organization_with_groups do
      groups { FactoryGirl.create_list(:group, 3) }
    end
  end

  factory :group do
    sequence(:name) { |n| "Example Group #{n}" }
  end
end