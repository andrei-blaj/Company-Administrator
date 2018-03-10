class AddCompanyToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :company_name, :string
  end
end
