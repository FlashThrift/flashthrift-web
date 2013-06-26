class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.has_attached_file :image_upload
      t.integer :item_id
      t.integer :image_id, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :images
  end
end
