class CreateItemStatuses < ActiveRecord::Migration
  def change
    create_table :item_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
