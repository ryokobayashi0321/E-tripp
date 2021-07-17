class SpotsController < ApplicationController
  PER_PAGE_SPOT = 9
  PER_PAGE_COMMENT = 3

  def index
    @q = Spot.ransack(params[:q])
    @spots = @q.result.all.includes(:prefecture).order(id: :asc).page(params[:page]).per(PER_PAGE_SPOT)
  end

  def show
    @spot = Spot.find(params[:id])
    @comment = Comment.new
    @comments = @spot.comments.order(created_at: :asc).page(params[:page]).per(PER_PAGE_COMMENT)
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :content, :photo, :prefecture_id)
  end
end
