class CreateJapanAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :japan_areas do |t|
      t.integer :area_name, null: false, default: 0

      t.timestamps
    end
  end
end
