class AddStatus < ActiveRecord::Migration
  def up
    add_column :items, :status, :string
  end

  def down
    remove_column :items, :status
  end
end
