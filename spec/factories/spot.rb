FactoryBot.define do
  factory :spot do
    spot_name { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    prefecture
  end
end
