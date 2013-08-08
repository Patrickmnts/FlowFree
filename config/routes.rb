Flowfree::Application.routes.draw do
  devise_for :users

  root to: 'site#index'

# routes for dropdown state select on homepage
  get '/rivers/by_state/:state', to: 'rivers#index'
  # not retrieving by state but POSTING instead
  post '/rivers/by_state', to: 'rivers#post_to_state', as: 'rivers_by_state'

# routes for search field on homepage
  get '/rivers/by_name/:search', to: 'rivers#search'
  post '/rivers/by_name', to: 'rivers#post_to_name', as: 'rivers_by_name'

# routes for search function within state pages
  get '/rivers/by_state_and_name/:state/:search', to: 'rivers#search'
  post '/rivers/by_state_and_name', to: 'rivers#post_to_state_and_name', as: 'rivers_by_state_by_name'

  resources :rivers, :except => :index


# USERS ROUTES!!!!
  get '/users/sign_in', to: 'devise/sessions#new', as: 'sign_in'
  get '/users/sign_up', to: 'devise/registrations#new', as: 'sign_up'
  match '/users/sign_out', to: 'devise/sessions#destroy', as: 'sign_out', via: 'delete'
  get '/users/:id', to: 'users#show', as: 'user_profile'

  resources :users


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
