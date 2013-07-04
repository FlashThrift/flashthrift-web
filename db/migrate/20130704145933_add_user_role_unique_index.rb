class AddUserRoleUniqueIndex < ActiveRecord::Migration
  def up
    add_index :roles_users, [:role_id, :user_id], :unique => true
  end

  def down
  end
end
