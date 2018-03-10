class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :work_relations
  has_many :subordinates, :through => :work_relations

  has_many :user_project_relations
  has_many :projects, :through => :user_project_relations

  after_create :check_user_type

  # After a user was created check if manager / employee
  # User curent: self.id == id
  def check_user_type

    if self.register_as == "CEO"

      self.ceo = true
      self.man = false
      self.emp = false
      self.paid = false

      self.num_of_managers = 0
      self.num_of_employees = 0

      self.paid = true if self.account_type == "startup"

      if paid?
        self.num_of_allowed_employees = 10
        self.num_of_allowed_managers = 3
      end

    elsif self.register_as == "MAN"
  		
      user1 = User.find_by(email: self.ceo_email) # in this case the CEO
      user2 = self

      self.ceo = false
      self.man = true
      self.emp = false
      self.paid = false

      self.paid = true if user1.paid?
      self.account_type = user1.account_type

      user1.update(num_of_managers: user1.num_of_managers + 1)
      self.num_of_employees = user1.num_of_employees

      WorkRelation.create(user_id: user1.id, subordinate_id: user2.id)
      Notification.create(recipient_id: user1.id, notification_type: 'new_man', seen: false, sender_id: user2.id)

  		self.company_name = user1.company_name

  	elsif self.register_as == "EMP"

  		user1 = User.find_by(email: self.manager_email) # in this case the MANAGER
      ceo = User.find_by(email: user1.ceo_email)
      user2 = self

      ceo.update(num_of_employees: ceo.num_of_employees + 1)
      user1.update(num_of_employees: ceo.num_of_employees)

      self.ceo = false
      self.man = false
      self.emp = true
      self.paid = false

      self.paid = true if user1.paid?
      self.account_type = ceo.account_type

      WorkRelation.create(user_id: user1.id, subordinate_id: user2.id)
      Notification.create(recipient_id: user1.id, notification_type: 'new_emp', seen: false, sender_id: user2.id)

      self.company_name = user1.company_name
  	end
  end

  # def superior
  #   work_relation = WorkRelation.find_by(subordinate_id: id)
  #   superior = User.find_by(id: work_relation.try(:user_id))
  # end
end
