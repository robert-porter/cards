Rails.application.routes.draw do

  namespace :ebay do
    resources :shipping_service_options
  end
  resources :shipping_service_options
  namespace :ebay do
    resources :shipping_services
  end
  namespace :ebay do
    resources :return_policies
  end
  # You can have the root of your site routed with "root"
  root 'page#home'

  resources :items
  get 'admin/items/:id/clone' => 'admin/items#clone'

  get 'items/buy/:id' => 'items#buy'

  namespace :admin do
    resources :items
    resources :sessions, :only => [:create, :destroy, :index]
    resources :grades
    resources :products

    resources :tags
    resources :manufacturers
    resources :teams
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'admin' => 'admin/sessions#entry'
  post 'admin/login' => 'admin/sessions#login'
  post 'admin/logout' => 'admin/sessions#logout'
  get 'admin/home' => 'admin/pages#home'

  match '/search_suggestions', to: 'search_suggestions#index', via: :get

  post '/paypal_hook' => 'orders#paypal_hook'

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
