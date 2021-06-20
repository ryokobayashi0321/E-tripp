class User < ApplicationRecord
  has_many :plans, dependent: :destroy
  has_many :likes, dependent: :destroy

  # user.liked_spots で user が「いいね!」しているメッセージの一覧を取得できるようになる
  has_many :liked_spots, through: :likes, source: :spot

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ゲストアカウントを取得する
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # AvatarUploaderとavatarカラムの連携
  mount_uploader :avatar, AvatarUploader
end
