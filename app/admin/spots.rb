ActiveAdmin.register Spot do
  permit_params :spot_name, :content, :photo, :prefecture_id, :likes_count

  # permit_params do
  #   permitted = [:spot_name, :content, :photo, :prefecture_id, :likes_count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
