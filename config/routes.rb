Survey::Application.routes.draw do

  get "questions/show"

  get "questions/create"

  get "questions/new"

  get "questions/update"

  get "questions/edit"

  get "questions/destroy"

  get "answers/show"

  get "answers/create"

  get "answers/new"

  get "answers/update"

  get "answers/edit"

  get "answers/destroy"

  match '/polls/toggle_live/:poll_id' => 'polls#toggle_live', :via => :put, :as => 'polls_toggle_live'

  # :controllers => { :registrations => "registrations" },
  # match '/dashboard' => 'home#dashboard', :as => 'user_root'
  # , :paths => { :sign_up => "dashboard" }

  devise_for :users
  
  devise_scope :users do
    resources :polls do
      resources :questions, :except => [:index] do
        resources :answer, :except => [:index]
      end
    end
  end


  get "registrations/after_sign_up_path_for"

  get '/sms' => 'sms#create'

  get "home/index"

  
  # An alternative way to route to the dashboard,
  
  # As it is, currently creating a second root for authenticated.  
  # match 'home/dashboard' => 'home#dashboard', :as => :dashboard


  # match "dashboard" => "home#dashboard"

  # get "home/dashboard", :to => "home#dashboard"

  # Triggered by subclassed reg controller
  # Passes along newly created user info.  
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  authenticated do
    root :to => 'home#dashboard'
  end

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
