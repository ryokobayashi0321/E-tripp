FactoryBot.define do
  factory :plan do
    title { Faker::Lorem.word }
    day { Faker::Date.in_date_period }
    note { Faker::Lorem.paragraph }
    user
  end
end
