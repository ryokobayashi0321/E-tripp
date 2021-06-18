class PlansController < ApplicationController
  before_action :set_plan, only: %i[edit update destroy]

  def index
    @plans = Plan.includes(:user).order(:created_at)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  # 新規投稿用の空のインスタンス
  def new
    @plan = Plan.new
  end

  def create
    @plan = current_user.plans.create!(plan_params)
    redirect_to plans_path
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
    redirect_to user_path
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :day, :note)
  end

  # 「自分のプラン」の中から URL の :id に対応するプランを探す
  # 「他人のプラン」の場合はエラーを出す
  def set_plan
    @plan = current_user.plans.find(params[:id])
  end
end
