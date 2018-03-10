Rails.application.routes.draw do

  get 'pages/home'
  get 'pages/show_managers'
  get 'pages/show_employees'
  get 'pages/new_project_notifications'
  get 'pages/new_manager_notifications'
  get 'pages/new_employee_notifications'
  get 'payments/upgrade_plan'

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
      post :upgrade_plan
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
