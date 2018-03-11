class ProjectNotification

	attr_accessor :current_user

	def initialize(current_user)
		self.current_user = current_user
	end

	def run
		Project.where(company_name: current_user.company_name).each do |proj|
  			if !proj.completed?

		  		project_deadline = proj.deadline
		  		todays_date = Date.today
		  		
		  		if project_deadline <= todays_date
		  			User.where(company_name: proj.company_name, email: proj.manager_email).each do |manager|

		  				WorkRelation.where(user_id: manager.id).each do |work_realation|
		  					Notification.create(recipient_id: work_realation.subordinate_id, notification_type: "passed_project_deadline", project_name: proj.title, project_id: proj.id, sender_id: manager.id, daily_task_id: nil)
		  				end
		  				
		  			end
		  		end

		  		DailyTask.where(project_id: proj.id).each do |daily_task|
			  		daily_task_deadline = daily_task.task_deadline

					if daily_task_deadline <= todays_date
						User.where(company_name: proj.company_name, email: proj.manager_email).each do |manager|

			  				WorkRelation.where(user_id: manager.id).each do |work_realation|
			  					Notification.create(recipient_id: work_realation.subordinate_id, notification_type: "passed_daily_task_deadline", project_name: proj.title, project_id: proj.id, sender_id: manager.id, daily_task_id: daily_task.id)
		  					end

		  				end
					end
					
				end

			end
		end
	end

end