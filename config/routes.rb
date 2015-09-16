Rails.application.routes.draw do
  resources :related_scripts
  resources :value_chains
  resources :process_modules
  resources :scripts do
    get :classification
  end
  resources :member_scripts
  resources :scipts
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :members
  match 'members/contributor/:id', controller: 'members', action: 'contributor', via: :get
  match 'members/customer/:id', controller: 'members', action: 'customer', via: :get

end
