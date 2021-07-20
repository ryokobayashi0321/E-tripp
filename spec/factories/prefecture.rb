FactoryBot.define do
  factory :prefecture do
    prefecture_name { Faker::Lorem.word }
  end
end
