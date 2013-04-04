class CreateUsersOrganizationsAndGroups < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name

      t.timestamps
    end

    create_table :organization_memberships do |t|
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end

    create_table :groups do |t|
      t.string :name
      t.integer :organization_id

      t.timestamps
    end

    create_table :group_subscriptions do |t|
      t.integer :organization_membership_id
      t.integer :group_id

      t.timestamps
    end
  end
end
