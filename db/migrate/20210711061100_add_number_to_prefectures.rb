class AddNumberToPrefectures < ActiveRecord::Migration[6.1]
  def change
    add_column :prefectures, :number, :integer, null: false, default: 0
  end
end
