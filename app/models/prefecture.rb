class Prefecture < ApplicationRecord
  has_many :spots, dependent: :destroy

  validates :prefecture_name, presence: true
end
