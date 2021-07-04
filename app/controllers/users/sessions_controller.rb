module Users
  class SessionsController < Devise::SessionsController
    def guest_sign_in
      sign_in User.guest
      redirect_to session_homes_index_path, notice: "ゲストユーザーとしてログインしました。"
    end

    def after_sign_in_path_for(resource)
      session_homes_index_path(resource)
    end

    def after_sign_out_path_for(resource)
      root_path(resource)
    end
  end
end
