class Contribution < ApplicationRecord
	belongs_to :daily_task

	validates :content, presence: true
	# validates :image, presence: true
	mount_uploader :image, ImageUploader

	after_create :notify_superior

	def notify_superior
		@current_user = User.find_by(id: self.user_id)

		@daily_task = DailyTask.find_by(id: self.daily_task_id)
		@project = Project.find_by(id: @daily_task.project_id)

		if @current_user.emp?
			@manager = User.find_by(email: @current_user.manager_email)
			Notification.create(recipient_id: @manager.id, notification_type: 'new_con', seen: false, project_name: @project.title, project_id: self.id, daily_task_id: @daily_task.id)
		elsif @current_user.ceo?
			@man = User.find_by(email: @project.manager_email)
			Notification.create(recipient_id: @man.id, notification_type: 'new_con', seen: false, project_name: @project.title, project_id: self.id, daily_task_id: @daily_task.id)
		elsif @current_user.man?
			# we want to send a notification to every employeee under the supervision of the current manager
			@current_user.work_relations.each do |manager_employee_relation|
				@employee = User.find_by(id: manager_employee_relation.subordinate_id)
				Notification.create(recipient_id: @employee.id, notification_type: 'new_con', seen: false, project_name: @project.title, project_id: self.id, daily_task_id: @daily_task.id)
			end
		end

	end

end
