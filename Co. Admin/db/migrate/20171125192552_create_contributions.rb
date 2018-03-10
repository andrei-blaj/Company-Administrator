class CreateContributions < ActiveRecord::Migration[5.1]
  def change
    create_table :contributions do |t|
      t.integer :user_id
      t.string :content
      t.string :image
      t.date :timestamp

      t.timestamps
    end
  end
end
