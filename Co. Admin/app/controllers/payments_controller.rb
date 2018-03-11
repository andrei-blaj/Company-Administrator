class PaymentsController < ApplicationController

	def pay

		@user = User.find(params[:id])

		if params[:company_plan_id] != nil
			@company_plan_id = params[:company_plan_id]
		else
			@company_plan_id = @user.company_plan_id
		end

		current_company_plan = CompanyPlan.find_by(id: @company_plan_id)

		@amount = current_company_plan.price
		@num_of_managers = current_company_plan.max_num_of_managers
		@num_of_employees = current_company_plan.max_num_of_employees
		@description = current_company_plan.plan

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

		@user.update(paid: true, company_plan_id: @company_plan_id)

		@user.work_relations.each do |ceo_manager_work_relation|
			@manager = User.find_by(id: ceo_manager_work_relation.subordinate_id)
			@manager.update(paid: true, company_plan_id: @company_plan_id)

			@manager.work_relations.each do |manager_employee_work_relation|
				@employee = User.find_by(id: manager_employee_work_relation.subordinate_id)
				@employee.update(paid: true, company_plan_id: @company_plan_id)
			end
		end

		redirect_to pages_home_path, notice: "Payment successful."

	end

end
