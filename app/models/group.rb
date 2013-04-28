class Group < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: {
    scope: :organization_id,
    case_sensitive: false,
    message: "has already been taken by another group in this organization"
  }

  belongs_to :organization

  has_many :group_subscriptions, :dependent => :destroy
  has_many :organization_memberships, :through => :group_subscriptions

  has_many :users, :through => :organization_memberships
end