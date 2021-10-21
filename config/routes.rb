Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'
  resources :orders
  resources :clients
  
  post '/rate' => 'rater#create', :as => 'rate'
  get 'profiles/index'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :skip => [:registrations]
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end

  namespace :api do
    namespace :v1 do
      get 'get_slots', to: 'slot#get_slots'
      get 'save_location', to: 'location#save_location'
    end
  end
end
