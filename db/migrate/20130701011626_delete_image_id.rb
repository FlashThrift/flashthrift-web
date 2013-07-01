class DeleteImageId < ActiveRecord::Migration
  def up
    remove_column :images, :image_id
  end

  def down
    add_column :images, :image_id, :integer
  end
end
