require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root to: "home#index"

  resources :users

	resources :departments do
    get :export_as_pdf
    resources :development_plans, except: [:index]
  end

  resources :development_plans, only: [] do
    resources :flow_steps, except: [:index]
  end

  resources :flow_steps, only: [] do
    resources :tasks, except: [:index]
  end

  resources :tasks, only: [] do 
    resources :comments
    resources :task_managements
  end



end
