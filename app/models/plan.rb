class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules, inverse_of: :plan, dependent: :destroy
  has_many :spots, through: :schedules
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true

  # plan.scheduled_spots で plan が「指定した時間」でspotsの一覧を取得できるようになる
  has_many :scheduled_spots, through: :schedules, source: :spot

  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  validates :day, presence: true
  validates_associated :schedules
end
