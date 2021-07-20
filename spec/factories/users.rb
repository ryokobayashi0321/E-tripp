FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { "test1234" }
    password_confirmation { password }
  end
end
