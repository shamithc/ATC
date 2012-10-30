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
  
  resources :admin do 
    collection do 
      get 'list_users'
      get 'list_admin'
      get 'list_manager'
      get 'list_employee'
    end
    member do
      get 'list_employees_manager'
      get 'list_customers_manager'
      get 'set_manager' 
      post 'set_manager' 
      delete 'delete_user' 
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
