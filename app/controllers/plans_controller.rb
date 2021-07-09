class PlansController < ApplicationController
  PER_PAGE = 6

  def index
    @plans = Plan.includes(:user).order(:created_at).page(params[:page]).per(PER_PAGE)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = current_user.plans.new
    @schdules = @plan.schedules.new
    @spots = @plan.spots.new(params[:id])
    @spot = Spot.all
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plan_path
    else
      render :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy!
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :day, :note,
                                 schedules_attributes: [:id, :specified_time, :spot_id, :plan_id, :_destroy]).merge(user_id: current_user.id)
  end

  def spot_up_params
    params.permit(:schedules, :spots)
  end
end
