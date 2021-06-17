Rails.application.routes.draw do
  root "homes#index"

  # ゲストユーザーを削除・パスワード再設定できないようにする
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :plans
  resources :users
end
