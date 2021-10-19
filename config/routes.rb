Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'profiles/index'
  resources :orders
  resources :clients
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :registrations => 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      get 'get_slots', to: 'slot#get_slots'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
