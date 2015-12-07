Rails.application.routes.draw do
  resources :addresses
  resources :systems
  resources :workplaces
  resources :banks
  resources :carts
  resources :reports do
    collection do
      get :invoice_report_per_date
    end
  end
  resources :invoices do
    collection do
      get :invoice_orchestration
      get :process_orchestration
      get :resend_invoice
      get :download
    end
  end
  resources :messages

  resources :prices do
    collection do
      get :script_prices
      put :create_prices
    end
  end
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
      get :autocomplete_organization
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
      get :script_orchestration
      get :process_orchestration
      get :check_complexity
      put :admin_update
      get :destroy_incomplete_script
    end
  end
  resources :member_scripts
  resources :requirements
  resources :searches do
    collection do
      get :find_process
    end
  end
  mount Upmin::Engine => '/iddqd'
  root to: 'visitors#index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users do
    collection do
      get :master_user
      get :master_registration
    end
  end
  resources :members do
    collection do
      get :contributor
      get :customer
      get :admin
      get :contributor_incomplete_actions
      get :lounge
    end
  end
  match '/uploads/:id/:basename.:extension', controller: 'script', action: 'download', via: :get
  match 'process_modules/:id/get_list_ajax', controller: 'process_modules', action: 'get_list_ajax', via: :get, as: :list_ajax
  match 'value_chains/set_classification/:id/:script_id', controller: 'value_chains', action: 'classification', via: :get, as: :classification_value_chain
  match 'related_scripts/destroy_ajax/:id', controller: 'related_scripts', action: 'destroy_ajax', via: :get
  match 'value_chains/build/:id', controller: 'value_chains', action: 'build', via: :get, as: :build_value_chain
end
