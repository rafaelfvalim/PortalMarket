Rails.application.routes.draw do
  resources :systems
  resources :workplaces
  resources :banks
  resources :carts
  resources :invoices
  resources :messages
  resources :prices
  resources :statuses
  resources :workplaces
  resources :wizard_scripts do
    collection do
      get :classification
      post :create_requeriement
      post :create_related
      get :destroy_requeriement
      get :destroy_related
    end
  end
  resources :buys do
    collection do
      get :show_product
    end
  end
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
      get :create_ajax
    end
  end

  resources :process_modules
  resources :scripts do
    collection do
      get :roll_back_script
      get :autocomplete_requeriment
      get :final_details
      get :autocomplete_related_script
      get :autocomplete
      get :update_status
      get :edit_additional_information
      get :remove_file_script
      get :remove_file_pdf
    end
  end
  resources :member_scripts
  resources :requirements
  resources :searches do
    collection do
      get :find_process
    end
  end
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
  match '/uploads/:id/:basename.:extension', controller: 'script', action: 'download', via: :get
  match 'process_modules/:id/get_list_ajax', controller: 'process_modules', action: 'get_list_ajax', via: :get, as: :list_ajax
  match 'value_chains/set_classification/:id/:script_id', controller: 'value_chains', action: 'classification', via: :get, as: :classification_value_chain
  match 'related_scripts/destroy_ajax/:id', controller: 'related_scripts', action: 'destroy_ajax', via: :get
  match 'value_chains/build/:id', controller: 'value_chains', action: 'build', via: :get, as: :build_value_chain
end
