Rails.application.routes.draw do

  resources :related_scripts do
    post :classification_create
  end
  resources :value_chains do
    collection do
      get 'build'
    end
  end
  resources :process_modules
  resources :scripts do
    get :classification
    collection do
      get 'autocomplete_requeriment'
      get 'autocomplete_related_script'
    end
  end
  resources :member_scripts
  resources :requirements


  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :members
  match 'members/contributor/:id', controller: 'members', action: 'contributor', via: :get
  match 'members/customer/:id', controller: 'members', action: 'customer', via: :get
  match 'requirements/destroy_ajax/:id', controller: 'requirements', action: 'destroy_ajax', via: :get
  match 'related_scripts/destroy_ajax/:id', controller: 'related_scripts', action: 'destroy_ajax', via: :get

end
