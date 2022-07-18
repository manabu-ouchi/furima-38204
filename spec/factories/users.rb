FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name          {"大内おおうちオオウチ"}
    last_name           {"学まなぶマナブ"}
    first_name_katakana {"オオウチ"}
    last_name_katakana  {"マナブ"}
    birth_date          {"1930-01-01"}
  end
end