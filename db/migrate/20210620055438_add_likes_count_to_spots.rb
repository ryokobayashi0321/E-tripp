class AddLikesCountToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :likes_count, :integer, default: 0
  end
end
