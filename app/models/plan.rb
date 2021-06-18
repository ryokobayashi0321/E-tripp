class Plan < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :day, presence: true
end
