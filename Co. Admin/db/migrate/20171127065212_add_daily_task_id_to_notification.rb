class AddDailyTaskIdToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :daily_task_id, :integer
  end
end
