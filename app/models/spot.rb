require "csv"
CSV_COLUMNS = %w[spot_name content photo].freeze
class Spot < ApplicationRecord
  belongs_to :prefecture
  has_many :schedules, dependent: :destroy
  has_many :plans, through: :schedules
  has_many :likes, dependent: :destroy

  # spot.scheduled_plansで spot を「指定した時間」のplanの一覧を取得できるようになる
  has_many :scheduled_plans, through: :schedules, source: :plan

  # spot.liked_users で post を「いいね!」しているユーザーの一覧を取得できるようになる
  has_many :liked_users, through: :likes, source: :user

  validates :spot_name, presence: true
  validates :content, presence: true
  validates :photo, presence:

  # csv
  def self.generate_csv
    CSV.generate do |csv|
      csv << CSV_COLUMNS
      all.find_each do |spot|
        csv << CSV_COLUMNS.map { |col| spot.send(col) }
      end
    end
  end

  # spot を user が「いいね！」しているときは「true」，「いいね」していないときは「false」
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
