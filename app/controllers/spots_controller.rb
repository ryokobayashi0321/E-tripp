class SpotsController < ApplicationController
  PER_PAGE_SPOT = 6
  PER_PAGE_COMMENT = 3

  def index
    @prefectures = Prefecture.all
    @q = Spot.ransack(params[:q])
    @spots = Spot.includes(:likes).order(id: :desc)
    @spots = @q.result.page(params[:page]).per(PER_PAGE_SPOT)
  end

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @comments = @spot.comments.order(created_at: :desc).page(params[:page]).per(PER_PAGE_COMMENT)
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :content, :photo, :prefecture_id)
  end
end
