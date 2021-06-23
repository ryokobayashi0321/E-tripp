class SpotsController < ApplicationController
  def index
    @spots = Spot.includes(:likes).order(:created_at)
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
    @spot = Spot.cleate!(spot_params)
    redirect_to spot
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :content, :photo)
  end
end
