module Api
class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:email])

        if @user.valid_password? params[:password]
            @user.ensure_auth_token
            data = {user_id: @user.id, auth_token: @user.auth_token}

            render json: data, status: 200
        end

    end

end
end
