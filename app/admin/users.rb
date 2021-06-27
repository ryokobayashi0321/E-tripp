ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :remember_created_at, :user_name, :avatar

  # permit_params do
  #   permitted = [:email, :encrypted_password, :remember_created_at, :user_name, :avatar]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
