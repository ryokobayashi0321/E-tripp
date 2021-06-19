class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.time :specified_time
      t.references :plan, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true

      t.timestamps
    end
    add_index :schedules, [:plan_id, :spot_id], unique: true
  end
end
