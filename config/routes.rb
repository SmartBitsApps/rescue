Rails.application.routes.draw do
  
  
  resource :cart
  resources :line_items
  resources :orders do
    resources :order_items
  end
  
  resources :products
  #devise_for :users, controllers: { sessions: 'users/sessions' } do
  #  get 'sign_in', to: 'user/sessions#new'
  #end
  
  devise_for :users, controllers: { sessions: 'users/sessions' }
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
