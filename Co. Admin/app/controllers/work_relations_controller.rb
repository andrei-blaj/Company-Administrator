class WorkRelationsController < ApplicationController
  
  before_action :authenticate_user!

  def create
  	
  end

  def destroy
    @work_relation = WorkRelation.find(params[:id])

    if @work_relation.user_id == current_user.id
    	@work_relation.destroy
    end

    redirect_to pages_show_managers_path
  end

  def see_all_subordinates
    user = User.find(params[:id])
  end
end
