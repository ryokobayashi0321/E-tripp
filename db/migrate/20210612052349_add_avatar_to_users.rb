class AddAvatarToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :user_name
      t.string :avatar
    end
  end
end
