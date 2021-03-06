class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :register_as, :string
    add_column :users, :company_name, :string
    add_column :users, :ceo_email, :string
    add_column :users, :manager_email, :string

    # remove_column :users, :manager_email, :string
  end
end
