class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title, null: false
      t.date :day, null: false
      t.text :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
