Rails.application.routes.draw do


  root to: 'public#index'
  
  get '/users/profile', to: 'users#profile'

  resource :event, only: [:show]
  resources :relationship_junctions
  resources :event_users
  # resources :organizations

  # namespace :organizations do
  #   resources :events
  #   resources :users, except: [:create]
  # end

  resources :users do
    resources :events
  end

  resources :organizations do
    resources :events
    resources :users, except: [:create]
  end

  resource :session, only: [:new, :create, :destroy]

  post '/organizations/search', to: 'organizations#search'
 
  post 'user_assign', to: 'sessions#user_assign', as: :user_assign
  post 'organization_assign', to: 'sessions#organization_assign', as: :organization_assign
  # This will create logout_path and logout_url as named helpers in your application. Calling logout_path will return /exit
  post 'user_request/:organization_id', to: 'relationship_junctions#user_request', as: :user_request
  
  post 'upgrade/:id', to: 'relationship_junctions#upgrade', as: :upgrade
  post 'downgrade/:id', to: 'relationship_junctions#downgrade', as: :downgrade
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
