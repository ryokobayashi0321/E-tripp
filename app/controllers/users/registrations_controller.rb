module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: %i[update destroy]
    before_action :configure_account_update_params, only: [:update]

    def ensure_normal_user
      redirect_to root_path, alert: "ゲストユーザーは更新・削除できません。" if resource.email == "guest@example.com"
    end

    protected

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :avatar])
    end
  end
end
