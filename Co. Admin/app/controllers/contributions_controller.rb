class ContributionsController < ApplicationController

	load_and_authorize_resource

	def new
		@contribution = DailyTask.new
	end

	def create
		authorize! :create, @contribution

		@daily_task = DailyTask.find_by(id: params[:daily_task_id])
		@contribution = @daily_task.contributions.create(contribution_params)

		redirect_to daily_task_path(@daily_task)
	end

	def destroy
		authorize! :destroy, @contribution

		@daily_task = DailyTask.find(params[:daily_task_id])
	    @contribution = @daily_task.contributions.find(params[:id])
	    @contribution.destroy

	    redirect_to daily_task_path(@daily_task)
	end

	# def edit
 #        @contribution = Contribution.find(params[:id])
 #    end

 #    def update
 #        authorize! :update, @contribution
 #        @contribution = Contribution.find(params[:id])

 #        if (@contribution.update(contribution_params))
 #              redirect_to @contribution
 #        else
 #          render 'edit'
 #        end

 #    end

	private
		def contribution_params
			params.require(:contribution).permit(:user_id, :image, :content, :timestamp, :daily_task_id)
		end
end
