require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "show" do
    let(:user) { FactoryGirl.create(:user_with_organizations) }

    before { visit user_path(user) }

    describe "groups for user's organizations" do
      # user.organizations.each do |organization|
      #   page.should have_content(organization.name)

      #   organization.groups.each do |group|
      #     page.should have_content(group.name)
      #   end
      # end

      it { should have_content(user.name) }
      it { should have_content(user.organizations.first.name) }
    end
  end
end
