module UsersHelper
  def user_page_title
    if user_signed_in? && @user == current_user
      "マイページ"
    else
      "ユーザーページ"
    end
  end
end
