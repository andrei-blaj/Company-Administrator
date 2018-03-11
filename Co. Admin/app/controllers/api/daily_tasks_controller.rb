module Api
class DailyTasksController < ApplicationController

    def get_tasks
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            tasks = DailyTask.where(project_id: params[:project_id])
            data = {daily_tasks: tasks}

            render json: data, status: 200
        end
    end

    def mark_as_completed
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            task = DailyTask.find_by(id: params[:task_id])

            if task
                task.update(completed: true, completed_on: DateTime.now)
            end
        end
    end

end
end
