class AddProjectIdToDailyTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_tasks, :project_id, :integer
  end
end
