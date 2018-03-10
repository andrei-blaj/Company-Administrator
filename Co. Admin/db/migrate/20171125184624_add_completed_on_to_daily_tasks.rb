class AddCompletedOnToDailyTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_tasks, :completed_on, :date
  end
end
