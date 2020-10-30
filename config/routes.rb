Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "home#index"

  resources :users

	resources :departments do
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
  end

end
