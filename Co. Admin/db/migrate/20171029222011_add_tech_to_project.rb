class AddTechToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :tech, :string
    
    remove_column :projects, :tech, :string
  end
end
