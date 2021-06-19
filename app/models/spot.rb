class Spot < ApplicationRecord
  belongs_to :prefecture

  validates :spot_name, presence: true
  validates :content, presence: true
  validates :photo, presence: true
end
