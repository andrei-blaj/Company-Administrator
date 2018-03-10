class PaymentsController < ApplicationController

	def pay

		@user = User.find(params[:id])

		if params[:account_type] != nil
			@account_type = params[:account_type]
		else
			@account_type = @user.account_type
		end

		if @account_type == "expanding"
			@amount = 99
			@num_of_managers = 5
			@num_of_employees = 30
			@description = "Expanding"
		elsif @account_type == "business"
			@amount = 199
			@num_of_managers = 15
			@num_of_employees = 150
			@description = "Business"
		else
			@amount = 399
			@num_of_managers = 10000000
			@description = "Enterprise"
		end

		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here: https://dashboard.stripe.com/account/apikeys
		Stripe.api_key = "sk_test_faPS66qgIoPgdQIlxJSAD1HC"

		# Token is created using Checkout or Elements!
		# Get the payment token ID submitted by the form:
		token = params[:stripeToken]

		# Charge the user's card:

		charge = Stripe::Charge.create(
		  :amount => (@amount * 100).to_i,
		  :currency => "usd",
		  :description => @description,
		  :source => token,
		)

		# Update the current user (CEO) and every other manager and employee in that company

		@user.update(account_type: @account_type)

		@user.update(paid: true, num_of_allowed_managers: @num_of_managers, num_of_allowed_employees: @num_of_employees)
		@user.work_relations.each do |ceo_manager_work_relation|
			@manager = User.find_by(id: ceo_manager_work_relation.subordinate_id)
			@manager.update(paid: true, account_type: @account_type)
			@manager.work_relations.each do |manager_employee_work_relation|
				@employee = User.find_by(id: manager_employee_work_relation.subordinate_id)
				@employee.update(paid: true, account_type: @account_type)
			end
		end

		redirect_to pages_home_path, notice: "Payment successful."

	end

end
