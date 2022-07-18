class AddNameToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :detail, :text
    add_column :items, :price, :integer
    add_column :items, :category_id, :integer
    add_column :items, :condition_id, :integer
    add_column :items, :delivery_id, :integer
    add_column :items, :prefecture_id, :integer
    add_column :items, :delivery_day_id, :integer
  end
end
