class WorkRelation < ApplicationRecord
	belongs_to :user
	belongs_to :subordinate, :class_name => "User"
end
