class SpotsController < ApplicationController
  before_action :set_spot, only: %w[show edit update destroy]
  def index
    @spots = Spot.includes(:likes).order(:created_at)
    # csvデータ表示
    respond_to do |format|
      format.html
      format.csv do
        send_data(@spots.generate_csv, filename: "spot_data.csv")
      end
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to @spot
    else
      render :new
    end
  end

  def edit; end

  def update
    if @spot.update(spot_params)
      redirect_to @spot
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to spots_url
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:spot_name, :content, :photo)
  end
end
