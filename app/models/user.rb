class User < ActiveRecord::Base
  include Clearance::User

  attr_accessible :email, :name, :password

  has_many :organization_memberships, :dependent => :destroy
  has_many :organizations, :through => :organization_memberships

  has_many :group_subscriptions, :through => :organization_memberships
  has_many :groups, :through => :group_subscriptions

  def subscribe!(group)
    organization_memberships.find_by_organization_id(group.organization_id).group_subscriptions.create!(group_id: group.id)
  end
end
