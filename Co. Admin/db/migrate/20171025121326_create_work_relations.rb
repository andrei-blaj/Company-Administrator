class CreateWorkRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :work_relations do |t|
      t.integer :user_id
      t.integer :subordinate_id

      t.timestamps
    end
  end
end
