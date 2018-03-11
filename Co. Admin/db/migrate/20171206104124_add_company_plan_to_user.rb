class AddCompanyPlanToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company_plan_id, :integer
  end
end
