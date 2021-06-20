class LikesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    current_user.likes.create!(spot_id: @spot.id)
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    current_user.likes.find_by(spot_id: @spot.id).destroy!
  end
end
