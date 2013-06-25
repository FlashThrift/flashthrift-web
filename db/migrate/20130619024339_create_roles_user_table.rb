class CreateRolesUserTable < ActiveRecord::Migration
  def up
    create_table :roles_users, :id => false do |t|
      t.integer :role_id
      t.integer :user_id
    end

    add_index :roles_users, [:role_id, :user_id]
  end

  def down
    drop_table :roles_users
  end
end
