class PagesController < ApplicationController

	before_action :authenticate_user!

	def show_managers
	end

	def show_employees
	end

	def home
	end

	def not_found
	end

end
