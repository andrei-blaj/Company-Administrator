class AddCompletedByToDailyTask < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_tasks, :completed_by, :integer
  end
end
