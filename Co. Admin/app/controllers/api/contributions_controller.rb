module Api
class ContributionsController < ApplicationController

    def get_contributions
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            contributions = Contribution.where(daily_task_id: params[:daily_task_id])
            data = {contributions: contributions}

            render json: data, status: 200
        end
    end

    def destroy
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            @contribution = Contribution.find_by(id: params[:contribution_id])

            @contribution.destroy
        end
    end

    def create_contribution
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            Contribution.create(daily_task_id: params[:daily_task_id], user_id: params[:user_id], image: params[:image], content: params[:content], timestamp: params[:timestamp])
        end
    end

end
end
