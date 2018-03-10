class UserProjectRelationsController < ApplicationController

	before_action :authenticate_user!

	def new
		@new_user_project_relation = UserProjectRelation.new
	end

	def create
		@user_project_relation = UserProjectRelation.new(relation_params)

		if (@user_project_relation.save)
			redirect_to projects_path
		end
	end

	private
		def relation_params
			params.require(:user_project_relation).permit(:user_id, :project_id, :contribution)
		end

end