class Schedule < ApplicationRecord
  belongs_to :plan
  belongs_to :spot

  validates :plan_id, uniqueness: {
    scope: :spot_id,
    message: "は同じプランに同じ時間を登録できません"
  }
end