Flowfree::Application.routes.draw do
  devise_for :users

# routes for dropdown state select on homepage
  get '/rivers/by_state/:state', to: 'rivers#index'
  post '/rivers/by_state', to: 'rivers#index', as: 'rivers_by_state'

# routes for search field on homepage
  get '/rivers/by_name/:search', to: 'rivers#search'
  post '/rivers/by_name', to: 'rivers#search', as: 'rivers_by_name'

# routes for user profile pages
  get '/rivers/for_user/:id', to: 'rivers#profile'
  post '/rivers/for_user', to: 'rivers#profile', as: 'rivers_for_user'

# routes for search function within state pages
  get '/rivers/by_state_and_name/:state/:search', to: 'rivers#search'
  post '/rivers/by_state_and_name', to: 'rivers#search', as: 'rivers_by_state_by_name'

  resources :rivers, :except => :index
  resources :users

  root to: 'site#index'

  get '/users/sign_in', to: 'devise/sessions#new'
  get '/users/sign_up', to: 'devise/registrations#new'
  match '/users/sign_out', to: 'devise/sessions#destroy', via: 'delete'
  # get '/rivers/index', to: 'rivers#show'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
