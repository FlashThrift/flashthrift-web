class ChangePrice < ActiveRecord::Migration
  def up
    remove_column :items, :price
    add_column :items, :price_cents, :integer
  end

  def down
    add_column :items, :price, :decimal
    remove_column :items, :price_cents
  end
end
