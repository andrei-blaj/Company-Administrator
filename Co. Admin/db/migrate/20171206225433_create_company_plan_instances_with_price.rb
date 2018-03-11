class CreateCompanyPlanInstancesWithPrice < ActiveRecord::Migration[5.1]
  def change
    CompanyPlan.create(id: 1, plan: "Start-Up", max_num_of_projects: 10, max_num_of_managers: 3, max_num_of_employees: 10, price: 0)
    CompanyPlan.create(id: 2, plan: "Expanding", max_num_of_projects: 20, max_num_of_managers: 5, max_num_of_employees: 30, price: 99)
    CompanyPlan.create(id: 3, plan: "Business", max_num_of_projects: 50, max_num_of_managers: 15, max_num_of_employees: 150, price: 199)
    CompanyPlan.create(id: 4, plan: "Enterprise", max_num_of_projects: 1000000, max_num_of_managers: 1000000, max_num_of_employees: 1000000, price: 399)
  end
end
