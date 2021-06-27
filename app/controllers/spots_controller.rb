class SpotsController < ApplicationController
  before_action :set_spot, only: %w[show edit update destroy]
  def index
    # csvデータ表示
    respond_to do |format|
      format.html
      format.csv do
        send_data(@spots.generate_csv, filename: "spot_data.csv")
      end
    end
    @prefectures = Prefecture.all
    @q = Spot.ransack(params[:q])
    @spots = Spot.includes(:likes).order(id: :asc)
  end

  def show; end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.create!(spot_params)
    redirect_to spot
  end

  def edit; end

  def update
    @spot = Spot.update!(spot_params)
    redirect_to post
  end

  def destroy
    @spot.destroy!
    redirect_to root_path
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:spot_name, :content, :photo)
  end
end
