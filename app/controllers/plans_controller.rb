class PlansController < ApplicationController
  before_action :setup_schdule!, only: [:add_spot, :delete_spot]

  def new
    @plan = Plan.new
    @plan.schedules.build
    @plan.spots.build
  end

  def add_spot
    @schedule = current_plan.schedules.build(spot_id: params[:spot_id]) if @schedule.blank?
    @schedule.save
    redirect_to new_plan_path
  end

  def delete_spot
    render :new if @schedule.destroy
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      render :new
    end
  end

  def index
    @plans = Plan.includes(:user).order(:created_at)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy!
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :day, :note,
                                 schedules_attributes: [:specified_time, {
                                   spots_attributes: [:spot_name, :content, :photo]
                                 }]).merge(user_id: current_user.id)
  end

  def setup_schdule!
    @schedule = current_plan.schedules.find_by(spot_id: params[:spot_id])
  end
end
