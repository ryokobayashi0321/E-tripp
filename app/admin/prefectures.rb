ActiveAdmin.register Prefecture do
  permit_params :prefecture_name, :number

  # permit_params do
  #   permitted = [:prefecture_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
