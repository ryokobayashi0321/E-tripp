class SpotsController < ApplicationController
  def index
    @spots = Spot.includes(:user, :likes).order(:created_at)
    @prefectures = Prefecture.all
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
