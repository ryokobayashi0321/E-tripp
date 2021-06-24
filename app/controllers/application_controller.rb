class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_plan

  def current_plan
    if current_user
      # ユーザーとプランの紐付け
      current_plan = current_user.plans || current_user.create_plans!
    else
      # セッションとプランの紐付け
      current_plan = Plan.find_by(id: session[:plan_id]) || Plan.create
      session[:plan_id] ||= current_plan.id
    end
    current_plan
  end
end
