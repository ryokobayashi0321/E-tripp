class PlansController < ApplicationController
  PER_PAGE = 3
  before_action :set_plan, only: %i[show edit update destroy]

  def index
    @plans = Plan.all.includes(:user, :spots, :schedules).order(id: :desc).page(params[:page]).per(PER_PAGE)
  end

  def show; end

  def new
    @plan = current_user.plans.new
    @schdules = @plan.schedules.new
    @spot = Spot.new
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to plans_path, notice: "作成しました！"
    else
      flash.now[:alert] = "作成に失敗しました。スポットを選択 or 正しい時間 を選択してください"
      render :new
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to plan_path, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @plan.destroy!
    redirect_to plans_path, alert: "削除しました"
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:title, :day, :note,
                                 schedules_attributes: [:id, :specified_time, :spot_id, :plan_id, :_destroy]).merge(user_id: current_user.id)
  end

  def spot_up_params
    params.permit(:schedules, :spots)
  end
end
