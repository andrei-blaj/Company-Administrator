class AddNumberOfManagersAndEmployeesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :num_of_managers, :integer
    add_column :users, :num_of_employees, :integer
    add_column :users, :num_of_allowed_managers, :integer
    add_column :users, :num_of_allowed_employees, :integer
  end
end
