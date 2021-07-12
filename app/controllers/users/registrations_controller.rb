module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: %i[update destroy]
    before_action :configure_account_update_params, only: [:update]

    def ensure_normal_user
      redirect_to user_path, alert: "ゲストユーザーは更新・削除できません。" if resource.email == "guest@example.com"
    end

    protected

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :avatar])
    end

    def after_sign_up_path_for(resource)
      session_homes_index_path(resource)
    end

    def after_update_path_for(_resource)
      # 自分で設定した「マイページ」へのパス
      user_path(current_user)
    end
  end
end
