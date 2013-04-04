class Organization < ActiveRecord::Base
  attr_accessible :name

  has_many :organization_memberships, :dependent => :destroy
  has_many :users, :through => :organization_memberships

  has_many :groups, :dependent => :destroy
end