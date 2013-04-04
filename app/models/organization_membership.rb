class OrganizationMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  has_many :group_subscriptions, :dependent => :destroy
  has_many :groups, :through => :group_subscriptions
end