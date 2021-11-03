Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'
  resources :orders
  resources :clients
  get 'reports/new'
  post 'reports/create'
  get 'reports/show'
  
  post '/rate' => 'rater#create', :as => 'rate'
  get 'profiles/index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end
  devise_for :users, :controllers => { :registrations => 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :api do
    namespace :v1 do
      get 'get_slots', to: 'slot#get_slots'
      get 'save_location', to: 'location#save_location'
    end
  end
end
