Rails.application.routes.draw do
  resources :products
  devise_for :users
 
  #get '/cart', to: 'order_items#index'
  #resources :order_items, path: '/cart/items' do
  #  collection do
  #    delete 'remove_multiple'
 #   end
 # end
  
  root to: 'products#index'
  
  #root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
