Rails.application.routes.draw do

  resources :statuses
  resources :checking_accounts do
    collection do
      get :member_ajax
    end
  end
  resources :related_scripts do
    post :classification_create
  end
  resources :value_chains do
    collection do
      get :edit_build
    end
  end

  resources :process_modules
  resources :scripts do
    collection do
      get :additional_information
      get :edit_additional_information
      get :roll_back_script
      get 'autocomplete_requeriment'
      get 'final_details'
      get 'autocomplete_related_script'
      put :update_status
      get :autocomplete
    end
  end
  resources :member_scripts
  resources :requirements
  resources :searches
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :members do
    collection do
      get 'contributor'
      get 'customer'
    end
  end
  # match 'members/contributor', controller: 'members', action: 'contributor', via: :get , as: :contributor_members
  # match 'members/customer', controller: 'members', action: 'customer', via: :get, as
  match 'value_chains/classification/:id', controller: 'value_chains', action: 'classification', via: :get, as: :process_value_chain
  match 'process_modules/:id/get_list_ajax', controller: 'process_modules', action: 'get_list_ajax', via: :get, as: :list_ajax
  match 'value_chains/get_classification/:id/:script_id', controller: 'value_chains', action: 'classification', via: :get, as: :classification_value_chain
  match 'requirements/destroy_ajax/:id', controller: 'requirements', action: 'destroy_ajax', via: :get
  match 'related_scripts/destroy_ajax/:id', controller: 'related_scripts', action: 'destroy_ajax', via: :get
  match 'value_chains/build/:id', controller: 'value_chains', action: 'build', via: :get, as: :build_value_chain
  match 'value_chains/create_ajax/:process_module_id/:script_id/:action_veb', controller: 'value_chains', action: 'create_ajax', via: :get, as: :create_ajax_value_chain

end
