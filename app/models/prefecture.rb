class Prefecture < ApplicationRecord
  has_many :spots, dependent: :destroy

  validate :prefecture_name, presence: true
end
