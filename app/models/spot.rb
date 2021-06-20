class Spot < ApplicationRecord
  belongs_to :prefecture
  has_many :schedules, dependent: :destroy
  has_many :likes, dependent: :destroy

  # spot.scheduled_plansで spot を「指定した時間」のplanの一覧を取得できるようになる
  has_many :scheduled_plans, through: :schedules, source: :plan

  # spot.liked_users で post を「いいね!」しているユーザーの一覧を取得できるようになる
  sas_many :liked_users, thorugh: :likes, source: :user

  validates :spot_name, presence: true
  validates :content, presence: true
  validates :photo, presence: true
end
