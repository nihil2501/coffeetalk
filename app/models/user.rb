class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :organization_memberships, :dependent => :destroy
  has_many :organizations, :through => :organization_memberships

  has_many :group_subscriptions, :through => :organization_memberships
  has_many :groups, :through => :group_subscriptions
end
