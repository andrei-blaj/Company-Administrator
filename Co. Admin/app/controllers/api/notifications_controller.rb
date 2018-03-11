module Api
class NotificationsController < ApplicationController

    def notif_count
        @user = User.find_by(auth_token: params[:auth_token])

        if @user
            notif_count = Notification.where(recipient_id: @user.id, notification_type: params[:notification_type]).count
            data = {notif_count: notif_count}

            render json: data, status: 200
        end
    end

    def project_notification
        @user = User.find_by(auth_token: params[:auth_token])

        if @user
            @notification = Notification.find_by(recipient_id: @user.id, notification_type: "new_proj", project_id: params[:project_id])

            if @notification
                @notification.destroy
            end
        end

    end

    def employee_notification
        @user = User.find_by(auth_token: params[:auth_token])

        if @user
            @notification = Notification.find_by(recipient_id: @user.id, notification_type: params[:notification_type], sender_id: params[:sender_id])

            if @notification
                @notification.destroy
            end
        end
    end

end
end
