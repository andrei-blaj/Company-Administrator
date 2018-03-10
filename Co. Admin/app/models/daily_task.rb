class DailyTask < ApplicationRecord
	validates :task_description, presence: true

	belongs_to :project
	has_many :contributions, dependent: :destroy
end
