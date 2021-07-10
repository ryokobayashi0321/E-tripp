Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "homes#home"
  get "session_homes/index", to: "session_homes#index"

  # ゲストユーザーを削除・パスワード再設定できないようにする
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  resources :users, only: [:index, :show]
  resource :prefectures, only: :index
  resources :spots, only: [:index, :show] do
    resources :schedules
    resource :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :plans
end
