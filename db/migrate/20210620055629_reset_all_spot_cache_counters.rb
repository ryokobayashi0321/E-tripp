class ResetAllSpotCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Spot.find_each { |spot| Spot.reset_counters(spot.id, :likes_count) }
  end

  def down; end
end
