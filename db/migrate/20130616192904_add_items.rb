class AddItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   "name"
      t.string   "description"
      t.integer  "price"
      t.string   "status"

      t.timestamps
    end
  end
end
