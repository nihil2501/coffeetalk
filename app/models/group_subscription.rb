class GroupSubscription < ActiveRecord::Base
  attr_accessible :group_id
  attr_accessible :organization_membership_id

  belongs_to :organization_membership
  belongs_to :group

  def user
    organization_membership.user
  end
end