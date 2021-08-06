class Spot < ApplicationRecord
  belongs_to :prefecture

  # spot.scheduled_plansで spot を「指定した時間」のplanの一覧を取得できるようになる
  has_many :schedules, inverse_of: :spot, dependent: :destroy
  has_many :scheduled_plans, through: :schedules, source: :plan

  # spot.commented_usersで spot を「コメント」したスポットの一覧を取得できるようになる
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user

  # spot.liked_users で sopt を「いいね!」しているユーザーの一覧を取得できるようになる
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :spot_name, presence: true
  validates :content, presence: true
  validates :photo, presence: true

  # spot を user が「いいね！」しているときは「true」，「いいね」していないときは「false」
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
