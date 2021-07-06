class SpotsController < ApplicationController
  PER_PAGE = 5

  def index
    @prefectures = Prefecture.all
    @q = Spot.ransack(params[:q])
    @spots = Spot.includes(:likes).order(id: :asc).page(params[:page]).per(PER_PAGE)
  end

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @comments = @spot.comments.order(created_at: :desc)
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :content, :photo, :prefecture_id)
  end
end
