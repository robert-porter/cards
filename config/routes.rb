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

  namespace :admin do
    resources :items
    resources :sessions, :only => [:create, :destroy, :index]
    resources :grades
    resources :products

    resources :tags
    resources :manufacturers
    resources :teams

    resources :orders

    get 'shipping/get_rates/:order_id' => 'shipping#get_rates'
    get 'shipping/create_shipping/:order_id' => 'shipping#create_shipping'
    get 'orders/toggle_processed/:id' => 'orders#toggle_processed'


  end

  get 'admin' => 'admin/pages#home'
  post 'admin/login' => 'admin/sessions#login'
  post 'admin/logout' => 'admin/sessions#logout'
  get 'admin/home' => 'admin/pages#home'

  resource :purchases
  get 'purchases/buy_now_pay_pal' => 'purchases#buy_now_pay_pal'
  get 'purchases/checkout_pay_pal' => 'payments#checkout_pay_pal'

  get 'purchases/buy_now' => 'purchases#buy_now'
  get 'purchases/checkout' => 'purchases#checkout'

  get 'shopping_cart/index' => 'shopping_carts#index'
  post 'shopping_cart/add_line_item' => 'shopping_carts#add_line_item'
  post 'shopping_cart/destroy_line_item/:id' => 'shopping_carts#destroy_line_item'
  post 'shopping_cart/destroy_all_line_items' => 'shopping_carts#destroy_all_line_items'

  post '/pay_pal_hook' => 'orders#pay_pal_hook'


  match '/search_suggestions', to: 'search_suggestions#index', via: :get

end
