class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_auth_token

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :work_relations, dependent: :destroy
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

      self.paid = true if self.company_plan_id == 1

    elsif self.register_as == "MAN"

      ceo = User.find_by(email: self.ceo_email) # in this case the CEO

      self.ceo = false
      self.man = true
      self.emp = false
      self.paid = false

      self.paid = true if ceo.paid?
      self.company_plan_id = ceo.company_plan_id

      ceo.update(num_of_managers: ceo.num_of_managers + 1)
      self.num_of_employees = ceo.num_of_employees

      WorkRelation.create(user_id: ceo.id, subordinate_id: self.id)
      Notification.create(recipient_id: ceo.id, notification_type: 'new_man', seen: false, sender_id: self.id)

  	  self.company_name = ceo.company_name

  	elsif self.register_as == "EMP"

  		man = User.find_by(email: self.manager_email) # in this case the MANAGER
      ceo = User.find_by(email: man.ceo_email)

      ceo.update(num_of_employees: ceo.num_of_employees + 1)
      man.update(num_of_employees: ceo.num_of_employees)

      self.ceo = false
      self.man = false
      self.emp = true
      self.paid = false

      self.paid = true if man.paid?
      self.company_plan_id = ceo.company_plan_id

      WorkRelation.create(user_id: man.id, subordinate_id: self.id)
      Notification.create(recipient_id: man.id, notification_type: 'new_emp', seen: false, sender_id: self.id)

      self.company_name = man.company_name
  	end
  end

  def ensure_auth_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end

  def reset_auth_token!
    self.auth_token = generate_auth_token
    save
  end

  private
  def generate_auth_token
    loop do
      token = Devise.friendly_token
      break token unless self.class.unscoped.where(auth_token: token).first
    end
  end

  # def superior
  #   work_relation = WorkRelation.find_by(subordinate_id: id)
  #   superior = User.find_by(id: work_relation.try(:user_id))
  # end
end
