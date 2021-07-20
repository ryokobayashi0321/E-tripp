FactoryBot.define do
  factory :schedule do
    specified_time { Faker::Time.forward }
    association :plan
    association :spot
  end
end
