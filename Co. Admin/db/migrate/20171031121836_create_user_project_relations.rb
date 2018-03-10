class CreateUserProjectRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_project_relations do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
