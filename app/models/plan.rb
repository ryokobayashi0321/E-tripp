class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy

  validates :title, presence: true
  validates :day, presence: true
end
