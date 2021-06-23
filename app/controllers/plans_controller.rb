class PlansController < ApplicationController
  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = Plan.includes(:user).order(:created_at)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
    @plan.schedules.new
  end

  def create
    @plan = Plan.new(plan_params)
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
    @plan.update!(plan_params)
    redirect_to @plan
  end

  def destroy
    @plan.destroy!
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :day, :note, schedules_attributes: [:id, :specified_time, :spot_id]).merge(user_id: current_user.id)
  end

  # 「自分のプラン」の中から URL の :id に対応するプランを探す
  # 「他人のプラン」の場合はエラーを出す
  def set_plan
    @plan = current_user.plans.find(params[:id])
  end
end
