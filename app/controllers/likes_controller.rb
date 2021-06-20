class LikesController < ApplicationController
  def create
    current_user.likes.create!(spot_id: @spot.id)
    @spot = Spot.find(params[:spot_id])
  end

  def destroy
    current_user.likes.find_by(spot_id: @spot.id).destroy!
    @spot = Spot.find(params[:spot_id])
  end
end
