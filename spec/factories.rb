FactoryGirl.define do
  factory :user do
    name "Example User"
    email "user@example.com"

    factory :user_with_organizations do
      after(:create) do |user|
        FactoryGirl.create_list(:organization_with_groups, 3).each do |organization|
          FactoryGirl.create(:organization_membership, organization_id: organization.id, user_id: user.id)
        end
      end
    end
  end

  factory :organization do
    sequence(:name) { |n| "Example Organization #{n}" }

    factory :organization_with_groups do
      after(:create) do |organization|
        FactoryGirl.create_list(:group, 3, organization: organization)
      end
    end
  end

  factory :organization_membership do
    ignore do
      organization_id 1
      user_id 1
    end
  end

  factory :group do
    sequence(:name) { |n| "Example Group #{n}" }

    organization
  end
end