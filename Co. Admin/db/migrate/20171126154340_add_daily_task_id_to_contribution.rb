class AddDailyTaskIdToContribution < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :daily_task_id, :integer
  end
end
