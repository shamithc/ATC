AsianTrading::Application.routes.draw do


  get "search/index"

  resources :customers do
    member do
      get 'next_followup'
      post 'next_followup'
    end
  end

  get "employee/index"

  get "manager/index"

  # get "admin/index"

  # get "home/index"

  root :to => "home#index"

  resource :search do
    collection do
      match 'search' => 'search#index', :via => [:post], :as => :search
    end
  end

  get 'get_brands/:item_id' => 'admin#get_brands', :via => :get, :as => :get_brands
  get 'new_brand/:item_id' => 'admin#new_brand', :via => :get, :as => :new_brand
  post 'create_brand/:item_id' => 'admin#create_brand', :via => :post, :as => :create_brand

  post 'load_brand/:item_id' => 'customers#load_brand', :as => :load_brand

  resources :admin do
    collection do
      get 'list_users'
      get 'list_admin'
      get 'list_manager'
      get 'list_employee'
      get 'setting'
      get 'new_item'
      post 'create_item'
    end
    member do
      get 'list_employees_manager'
      get 'list_customers_manager'
      get 'set_manager'
      post 'set_manager'
      delete 'delete_user'
      delete 'delete_item'
      delete 'delete_brand'
      # get ''

    end
  end
  resources :employee do
    collection do
      get 'list_customers'
    end
  end
  resources :manager do
    collection do
      get 'list_customers'
      get 'list_employees_manager'
    end
    member do
      get 'list_customers_employee'
    end
  end


  devise_for :users, :controllers => {:sessions => "session",   :registrations => "registration"}


  devise_for :users do
      root :to => 'home#index'
  end
end
