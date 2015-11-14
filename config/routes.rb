Rails.application.routes.draw do
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

  ## Registration Routes

  post "signup", to: "registrations#create"
  delete "signup", to: "registrations#delete"
  post "login", to: "registrations#login"

  ## User Routes

  # get "users/:user_id", to: "users#show"
  # get "users/:user_id/journeys", to: "users#index"

  ## Journey Routes

  get "journeys", to: "journeys#index"
  post "journeys", to: "journeys#create"
  patch "journeys/:journey_id", to: "journeys#update"
  get "journeys/:journey_id", to: "journeys#show"
  delete "journeys/:journey_id", to: "journey#destroy"

  ## Image Routes

  get "journeys/:journey_id/images", to: "images#index"
  post "journeys/:journey_id/images", to: "images#create"
  get "images/:image_id", to: "images#show"
  delete "images/:image_id", to: "images#destroy"

  ## Comment Routes

  get "journeys/:journey_id/comments", to: "comments#index"
  post "journeys/:journey_id/comments", to: "comments#create"
  patch "comments/:comment_id", to: "comments#update"
  delete "comments/:comment_id", to: "comments#destroy"

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
