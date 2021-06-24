class PlansController < ApplicationController
  def index
    @plans = Plan.includes(:user).order(:created_at)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
    @plan.schedules.build
    @plan.spots.build
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      render :new
    end
  end

  def update_spot
    @schedule.update!(plan_params)
    redirect_to @plan
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy!
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :day, :note,
                                 schedules_attributes: [:id, :specified_time, :spot_id, :spot_name, :_destroy, {
                                   spots_attributes: [:spot_name, :content, :photo]
                                 }]).merge(user_id: current_user.id)
  end
end
