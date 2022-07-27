FactoryBot.define do
  factory :order_delivery_address do
    post_code { '123-1234' }
    city { '町田市' }
    address { '1-1' }
    building_name { '成瀬ビル' }
    phone_number { '09011111111' }
    token { 'tok_abcdefghijk00000000000000000' }
    prefecture_id { '2' }
  end
end
