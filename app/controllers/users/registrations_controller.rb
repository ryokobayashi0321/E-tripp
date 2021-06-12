module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :ensure_normal_user, only: %i[update destroy]
    before_action :configure_account_update_params, only: [:update]

    def ensure_normal_user
      redirect_to root_path, alert: "ゲストユーザーは更新・削除できません。" if resource.email == "guest@example.com"
    end

    def edit
      redirect_to user_path(current_user) unless @user == current_user
    end

    def update
      if current_user.update(user_params)
        redirect_to user_path(current_user)
      else
        redirect_to edit_user_path(current_user)
      end
    end

    def destroy; end

    private

    # 情報更新時にuser_name,avatarの取得を許可
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:name, :avatar,
                 :email, :password, :password_confirmation, :current_password)
      end
    end

    # def after_update_path_for(_resource)
    #   user_path(current_user)
    # end

    def user_params
      params.require(:user).permit(:user_name, :avatar)
    end
  end
end
