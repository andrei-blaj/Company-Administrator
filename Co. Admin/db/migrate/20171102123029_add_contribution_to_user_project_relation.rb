class AddContributionToUserProjectRelation < ActiveRecord::Migration[5.1]
  def change
    add_column :user_project_relations, :contribution, :string
  end
end
