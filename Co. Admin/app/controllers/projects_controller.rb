class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_paid
  load_and_authorize_resource

  def index

    if params[:search]
      @projects = Project.where("title LIKE ? OR tech LIKE ? OR manager_email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @projects = Project.all
    end

  end

  def new
  	@project = Project.new
  end

  def show
    authorize! :read, @project
    @project = Project.find_by(id: params[:id])
  end

  def create
      authorize! :create, @project

      @project = Project.new(project_params)

      @project.company_name = current_user.company_name

      @project.daily_tasks.each do |daily_task|
          daily_task.update(completed: false)
      end

      if (@project.save)
          redirect_to @project
      else
          render 'new'
      end

    end

    def edit
        @project = Project.find_by(id: params[:id])
    end

    def update
        authorize! :update, @project
        @project = Project.find_by(id: params[:id])

        if (@project.update(project_params))
              redirect_to @project
        else
          render 'edit'
        end

    end

    def destroy
        authorize! :destroy, @project
        @project = Project.find_by(id: params[:id])

        # Delete all notifications containing this project's id
        Notification.where(:project_id => @project.id).each do |notif|
          Notification.delete(notif.id)
        end
        
        @project.destroy
        
        redirect_to projects_path
    end

    private
        def project_params
            params.require(:project).permit! 
        end

    private
        def check_if_paid
          redirect_to pages_home_path if !current_user.paid?
        end
end
