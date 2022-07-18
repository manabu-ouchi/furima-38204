class ChangeColumnOfItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :items, :detail, false
    change_column_null :items, :price, false
    change_column_null :items, :category_id, false
    change_column_null :items, :condition_id, false
    change_column_null :items, :delivery_id, false
    change_column_null :items, :prefecture_id, false
    change_column_null :items, :delivery_day_id, false
  end
end
