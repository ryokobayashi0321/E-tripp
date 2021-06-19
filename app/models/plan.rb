class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy

  # plan.scheduled_spots で plan が「指定した時間」でspotsの一覧を取得できるようになる
  has_many :scheduled_spots, through: :schedules, source: :spot

  validates :title, presence: true
  validates :day, presence: true
end
