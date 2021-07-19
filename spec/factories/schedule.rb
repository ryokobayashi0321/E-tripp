FactoryBot.define do
  factory :schedule do
    specified_time { "18:00" }
    association :plan
    association :spot
  end
end
