class AddProjectNameToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :project_name, :string
  end
end
