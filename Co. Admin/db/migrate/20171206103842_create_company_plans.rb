class CreateCompanyPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :company_plans do |t|
      t.string :plan
      t.integer :max_num_of_projects
      t.integer :max_num_of_employees
      t.integer :max_num_of_managers

      t.timestamps
    end
  end
end
