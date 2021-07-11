class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :user_id, uniqueness: {
    scope: :spot_id,
    message: "は同じスポットに2回以上コメントはできません"
  }
  validates :comment, presence: true, length: { maximum: 125 }
end
