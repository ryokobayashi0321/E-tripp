class SpotsController < ApplicationController
  def index
    @prefectures = Prefecture.all
    @q = Spot.ransack(params[:q])
    @spots = Spot.includes(:likes).order(id: :asc)
  end

  def show
    @spot = Spot.find(params[:id])
    @comment = current_user.comments.new
    @comments = @spot.comments
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :content, :photo)
  end
end
