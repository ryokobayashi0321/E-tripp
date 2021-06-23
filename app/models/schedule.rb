class Schedule < ApplicationRecord
  belongs_to :plan, autosave: true
  belongs_to :spot, autosave: true

  validates :plan_id, uniqueness: {
    scope: :spot_id,
    message: "は同じプランに同じ時間を登録できません"
  }
end
