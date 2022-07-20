FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    detail { Faker::Lorem.sentence }
    price { '1000' }
    category_id { '2' }
    condition_id { '2' }
    delivery_id { '2' }
    prefecture_id { '2' }
    delivery_day_id { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
