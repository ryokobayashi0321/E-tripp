class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    @prefectures = Prefecture.all
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
