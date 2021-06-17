class ApplicationController < ActionController::Base
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :avatar])
  end
end
