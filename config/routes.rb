Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :members
  match 'members/contributor/:id', controller: 'members', action: 'contributor', via: :get
  match 'members/customer/:id', controller: 'members', action: 'customer', via: :get
end
