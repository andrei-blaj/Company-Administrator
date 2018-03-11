class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(current_user)	
  	ProjectNotification.new(current_user).run
  end

end
