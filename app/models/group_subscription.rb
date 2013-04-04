class GroupSubscription < ActiveRecord::Base
  belongs_to :organization_membership
  belongs_to :group
end