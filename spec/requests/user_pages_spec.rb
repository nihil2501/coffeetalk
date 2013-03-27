require 'spec_helper'

describe "User pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { visit user_path(user) }

  describe "show" do
    it { should have_content(user.name) }
    it { should have_content(user.email) }
  end
end
