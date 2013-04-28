class Organization < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :organization_memberships, :dependent => :destroy
  has_many :users, :through => :organization_memberships

  has_many :groups, :dependent => :destroy
end