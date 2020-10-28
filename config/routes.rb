Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "home#index"
  resources :users
  resources :departments
  resources :development_plans
  resources :flow_steps

  
end

