class User < ApplicationRecord
  has_many :plans, dependent: :destroy
  accepts_nested_attributes_for :plans
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # user.commented_spots で user が「コメント」しているスポットの一覧を取得できるようになる
  has_many :commented_spots, through: :comments, source: :spot

  # user.liked_spots で user が「いいね!」しているスポットの一覧を取得できるようになる
  has_many :liked_spots, through: :likes, source: :spot

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アカウントを取得する
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # AvatarUploaderとavatarカラムの連携
  mount_uploader :avatar, AvatarUploader

  # plan作成の準備
  def prepare_plan
    plan || create_plan
  end
end
