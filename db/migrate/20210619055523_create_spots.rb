class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :spot_name, null: false
      t.text :content, null: false
      t.string :photo, null: false
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
