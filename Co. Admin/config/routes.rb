Rails.application.routes.draw do

  get 'pages/home'
  get 'pages/show_managers'
  get 'pages/show_employees'
  get 'pages/new_project_notifications'
  get 'pages/new_manager_notifications'
  get 'pages/new_employee_notifications'
  get 'payments/upgrade_plan'

  namespace :api, defaults: {format: :json} do
      post 'login', to: 'sessions#create'
      resources :users do
          collection do
              get :manager_count
              get :employee_count_for_ceo
              get :employee_count_for_man
              get :get_managers
              get :get_employees
              get :get_employees_for_man
              get :get_superior_of_employee
          end
      end
      resources :projects do
          collection do
              get :project_count
              get :get_projects
              get :get_project
          end
      end
      resources :daily_tasks do
          collection do
              get :get_tasks
              patch :mark_as_completed
          end
      end
      resources :contributions do
          collection do
              get :get_contributions
              post :create_contribution
          end
      end
      resources :notifications do
          collection do
              get :notif_count
              delete :project_notification
              delete :employee_notification
          end
      end
      resources :payments do
          collection do
              post :pay
          end
      end

  end

  resources :projects

  resources :user_project_relations

  resources :work_relations

  resources :daily_tasks do
    resources :contributions
    # member do
    #   post :mark_as_completed
    # end
  end

  resources :payments do
    member do
      post :pay
    end
  end

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do

  	authenticated :user do
    	root to: 'pages#home', as: :authenticated_root
    end

  	unauthenticated do
    	root to: 'devise/sessions#new', as: :unauthenticated_root
  	end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '*a', :to => 'errors#routing', via: :get

end
