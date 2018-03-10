class AddCompletedToDailyTask < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_tasks, :completed, :boolean
  end
end
