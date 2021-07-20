class Schedule < ApplicationRecord
  belongs_to :spot, optional: true
  belongs_to :plan, optional: true

  validates :plan_id, uniqueness: {
    scope: :spot_id,
    message: "は同じプランに同じ時間を登録できません"
  }
  validates :specified_time, presence: true
end
