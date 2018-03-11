module Api
class ProjectsController < ApplicationController

    # imi trebuie param de auth_token ca sa pot face cautarea
    #
    def project_count
        @user = User.find_by(auth_token: params[:auth_token])

        if @user

            if @user.man?
                num_of_proj = Project.where(company_name: @user.company_name, manager_email: @user.email).count
            elsif @user.emp?
                num_of_proj = Project.where(company_name: @user.company_name, manager_email: @user.manager_email).count
            else
                num_of_proj = Project.where(company_name: @user.company_name).count
            end
            data = {project_count: num_of_proj}

            render json: data, status: 200
        end
    end

    def get_projects
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            @user = User.find_by(email: params[:user_email])

            if @user.man?
                proj = Project.where(manager_email: @user.email)
            elsif @user.emp?
                proj = Project.where(manager_email: @user.manager_email)
            else
                proj = Project.where(company_name: @user.company_name)
            end
            data = {projects: proj}

            render json: data, status: 200
        end
    end

    def get_project
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            proj = Project.find_by(id: params[:project_id])
            data = {project: proj}

            render json: data, status: 200
        end
    end

    def destroy
        @user = User.find_by(auth_token: params[:auth_token])

        if @user.ceo?
            @project = Project.find_by(id: params[:project_id])

            # Delete all notifications containing this project's id
            Notification.where(:project_id => @project.id).each do |notif|
              Notification.delete(notif.id)
            end

            @project.destroy
        end
    end

end
end
