class Spot < ApplicationRecord
  belongs_to :prefecture
  has_many :schedules, dependent: :destroy

  validates :spot_name, presence: true
  validates :content, presence: true
  validates :photo, presence: true
end
