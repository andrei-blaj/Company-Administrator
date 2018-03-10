class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.string :notification_type
      t.boolean :seen

      t.timestamps
    end
  end
end
