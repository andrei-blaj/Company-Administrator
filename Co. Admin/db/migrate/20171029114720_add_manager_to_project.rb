class AddManagerToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :manager_email, :string
  end
end
