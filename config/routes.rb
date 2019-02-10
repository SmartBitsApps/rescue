Rails.application.routes.draw do
  devise_for :users
  
  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end
  
  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  
  root to: 'categories#index'
  
  #root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
