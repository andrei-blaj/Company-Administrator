class CreateDailyTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_tasks do |t|
      t.string :task_description
      t.date :task_deadline

      t.timestamps
    end
  end
end
