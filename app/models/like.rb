class Like < ApplicationRecord
  belongs_to :user
  belongs_to :spot, counter_cache: :likes_count

  validates :user_id, uniqueness: {
    scope: :spot_id,
    message: "は同じスポットに2回以上いいねはできません"
  }
end
