class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :post_code, nill: false
      t.string :city, nill: false
      t.string :address, nill: false
      t.string :building_name
      t.string :phone_number, nill: false
      t.string :prefecture_id, nill: false
      t.references :order ,null: false, foreign_key: true


      t.timestamps
    end
  end
end