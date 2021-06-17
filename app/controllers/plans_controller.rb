class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    Plan.create(plan_params)
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(user_params)
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :day, :note, :user)
  end
end
