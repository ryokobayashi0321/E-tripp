module Users
  class SessionsController < Devise::SessionsController
    def guest_sign_in
      sign_in User.guest
      redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      flash[:success] = "User already exists." unless (@user = User.find_by(email: params[:email]))
      if @user.save
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end

    private

    def post_params
      params.require(:user).permit(:user_name, :avatar)
    end
  end
end
