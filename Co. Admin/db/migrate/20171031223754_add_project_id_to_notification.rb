class AddProjectIdToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :project_id, :integer
  end
end
