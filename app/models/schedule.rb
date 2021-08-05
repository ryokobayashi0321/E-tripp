class Schedule < ApplicationRecord
  belongs_to :spot, optional: true
  belongs_to :plan, optional: true

  validates :plan_id, uniqueness: {
    scope: :spot_id,
    message: "同じスポットは登録できません"
  }
  validates :specified_time, presence: true, uniqueness: { message: "は登録できません" }
  validates :spot_id, presence: true
end
