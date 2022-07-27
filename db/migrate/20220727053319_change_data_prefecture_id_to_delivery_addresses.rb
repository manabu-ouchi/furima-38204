class ChangeDataPrefectureIdToDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :delivery_addresses, :prefecture_id, :integer
  end
end
