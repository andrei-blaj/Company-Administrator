class UserProjectRelation < ApplicationRecord
	belongs_to :user, :class_name => "User"
	belongs_to :project	

	after_create :create_notification

	def create_notification
		@user = User.find_by(id: self.user_id)
		@manager = User.find_by(email: @user.manager_email)
		@project = Project.find_by(id: self.project_id)

		Notification.create(recipient_id: @manager.id, notification_type: 'new_con', seen: false, project_name: @project.title, project_id: self.project_id)
	end

end
