class Group < ActiveRecord::Base
  attr_accessible :name

  belongs_to :organization

  has_many :group_subscriptions, :dependent => :destroy
  has_many :organization_memberships, :through => :group_subscriptions

  has_many :users, :through => :organization_memberships
end