class DailyTasksController < ApplicationController

    load_and_authorize_resource
    respond_to :html, :js, :json, :xml

    def new
        @daily_task = DailyTask.new
    end

    def show
        authorize! :read, @daily_task
        @daily_task = DailyTask.find(params[:id])

        respond_to do |format|
          format.html {}
          format.js { render json: @project }
        end
    end

    def update
        authorize! :update, @daily_task
        daily_task = DailyTask.find(params[:id])
        daily_task.update(completed: true, completed_by: current_user.id, completed_on: DateTime.now)
        @project = Project.find_by(id: daily_task.project_id)

        if !@project.completed
            daily_task_count = @project.daily_tasks.count
            completed_daily_tasks = 0
            @project.daily_tasks.each do |dt|
                if dt.completed == true
                    completed_daily_tasks += 1
                end
            end
            if daily_task_count == completed_daily_tasks
                @project.update(completed: true)

                # ceo = User.find_by(ceo: true, company_name: @project.company_name)
                # Notification.create(recipient_id: ceo)
            end
        end

        # if current_user.register_as == "MAN"
        # 	@ceo = User.find_by(email: current_user.ceo_email)

        # 	Notification.create(recipient_id: @ceo.id, notification_type: 'task_completed', seen: false, sender_id: current_user.id, project_id: daily_task.project_id, project_name: @project.title)
        # end

    end

end
