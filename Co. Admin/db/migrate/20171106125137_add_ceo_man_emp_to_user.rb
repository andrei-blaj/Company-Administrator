class AddCeoManEmpToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ceo, :boolean
    add_column :users, :man, :boolean
    add_column :users, :emp, :boolean
  end
end
