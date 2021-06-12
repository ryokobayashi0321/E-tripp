module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: %i[update destroy]
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    def ensure_normal_user
      redirect_to root_path, alert: "ゲストユーザーは更新・削除できません。" if resource.email == "guest@example.com"
    end

    def create; end

    def update; end

    def destroy; end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :avatar])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :avatar])
  end
end
