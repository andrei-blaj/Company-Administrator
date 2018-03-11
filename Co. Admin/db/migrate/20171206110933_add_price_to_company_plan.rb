class AddPriceToCompanyPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :company_plans, :price, :integer
  end
end
