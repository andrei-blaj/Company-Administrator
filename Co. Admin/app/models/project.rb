class Project < ApplicationRecord

  validates :manager_email, presence: true
  validates :title, presence: true
  validates :description, presence: true

  has_many :user_project_relations
  has_many :users, :through => :user_project_relations

  has_many :daily_tasks, dependent: :destroy
  accepts_nested_attributes_for :daily_tasks, allow_destroy: true

  after_create :create_notification

  def create_notification

    manager = User.find_by(email: self.manager_email)

    manager.work_relations.each do |manager_employee_relation|
      employee = User.find_by(id: manager_employee_relation.subordinate_id)
      Notification.create(recipient_id: employee.id, notification_type: 'new_proj', seen: false, project_name: self.title, project_id: self.id)
    end

    Notification.create(recipient_id: manager.id, notification_type: 'new_proj', seen: false, project_name: self.title, project_id: self.id)

  end

end
