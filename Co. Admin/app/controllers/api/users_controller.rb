module Api
class UsersController < ApplicationController
    before_action :auth_only!, except: [:create]

    # metoda de show, param user id
    def show
        @user = User.find_by(id: params[:id])

        if @user

            data = {
                id: @user.id,
                email: @user.email,
                first_name: @user.first_name,
                last_name: @user.last_name,
                register_as: @user.register_as,
                company_name: @user.company_name,
                ceo_email: @user.ceo_email,
                manager_email: @user.manager_email,
                ceo: @user.ceo,
                man: @user.man,
                emp: @user.emp,
                paid: @user.paid,
                num_of_managers: @user.num_of_managers,
                num_of_employees: @user.num_of_employees,
                company_plan_id: @user.company_plan_id
            }

            render json: data, status: 200
        end

    end

    def manager_count
        @user = User.find_by(auth_token: params[:auth_token])

        if @user
            num_of_man = User.where(ceo_email: @user.email, company_name: @user.company_name, man: true).count
            data = {manager_count: num_of_man}

            render json: data, status: 200
        end
    end

    def employee_count_for_ceo
        @user = User.find_by(auth_token: params[:auth_token])

        if @user
            num_of_emp = User.where(company_name: @user.company_name, emp: true).count
            data = {employee_count: num_of_emp}

            render json: data, status: 200
        end
    end

    def employee_count_for_man
        @user = User.find_by(auth_token: params[:auth_token])

        if @user
            num_of_emp = User.where(company_name: @user.company_name, manager_email: @user.email, emp: true).count
            data = {employee_count: num_of_emp}

            render json: data, status: 200
        end
    end

    def get_managers
        @user = User.find_by(auth_token: params[:auth_token])

        if @user
            managerList = User.where(company_name: @user.company_name, ceo_email: @user.email, man: true)
            data = {manager_list: managerList}

            render json: data, status: 200
        end
    end

    def get_employees
        @user = User.find_by(auth_token: params[:auth_token])

        if @user

            if @user.ceo?
                employeeList = User.where(company_name: @user.company_name, emp: true)
            else
                employeeList = User.where(manager_email: @user.email, emp: true)
            end

            data = {employee_list: employeeList}

            render json: data, status: 200
        end
    end

    def get_employees_for_man
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            employeeList = User.where(manager_email: params[:manager_email], emp: true)
            data = {employee_list: employeeList}

            render json: data, status: 200
        end
    end

    def get_superior_of_employee
        @check_auth = User.find_by(auth_token: params[:auth_token])

        if @check_auth
            @user = User.find_by(email: params[:employee_email])
            @superior = User.find_by(email: @user.manager_email)
            if @superior
                data = {first_name: @superior.first_name, last_name: @superior.last_name, email: @superior.email}

                render json: data, status: 200
            end
        end
    end
    
end
end
