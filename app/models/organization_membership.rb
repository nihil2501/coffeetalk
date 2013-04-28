class OrganizationMembership < ActiveRecord::Base
  attr_accessible :organization_id, :user_id

  belongs_to :user
  belongs_to :organization

  has_many :group_subscriptions, :dependent => :destroy
  has_many :groups, :through => :group_subscriptions
end