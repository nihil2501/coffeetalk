require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "show" do
    let(:user) {  FactoryGirl.create(:user_with_organizations) }

    describe "sidebar" do
      before { visit user_path(user.id) }

      it "should show groups for user's organizations" do
        user.organizations.each do |organization|
          page.should have_content(organization.name)

          organization.groups.each do |group|
            page.should have_content(group.name)
          end
        end
      end
    end

    describe "group subscriptions" do
      let(:group_id)  { user.organizations.first.groups.first.id }

      describe "subscribe" do
        before do
          visit user_group_path(user.id, group_id)
          click_button "Subscribe"
        end

        it { should have_selector("input[type=submit][value='Unsubscribe']")}
      end

      describe "unsubscribe" do
        before do
          user.subscribe!(Group.find(group_id))
          visit user_group_path(user.id, group_id)
          click_button "Unsubscribe"
        end

        it { should have_selector("input[type=submit][value='Subscribe']")}
      end
    end
  end
end
