class AddDetailsToSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column_null :schedules, :specified_time, false
  end
end
