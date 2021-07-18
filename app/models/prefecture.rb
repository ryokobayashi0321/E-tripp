class Prefecture < ApplicationRecord
  has_many :spots, dependent: :destroy

  validates :prefecture_name, presence: true
  validates :number, presence: true

  def display_name
    prefecture_name
  end
end
