Rails.application.routes.draw do
  
  # get 'carts/show'
  root 'home#index'
  post 'home/newsletter', to: "home#newsletter", as: "home_newsletter"
  
  post '/session', to: "session#create", as: "sessions"
  # get 'categories/:id', to: "categories#show", as: "category"
  # get 'products/index', to: 'products#index'
  
  
  # get 'savedlists/show', to: "savedlists#show", as: "savedlist"
  # put 'savedlists/:id', to: "savedlists#update", as: "savedlist_update"
  # get 'savedlists/:id', to: "savedlists#show", as: "savedlist"
  # get 'products/create', to: "products#create"
  # get 'products/:id', to: "products#show", as: "product"
  
  # delete 'savedlists/:id/', to: "savedlists#destroy" as 
  resources :savedlists, only: [:update, :show]
  resources :products, only: [:index, :create, :show, :edit]
  resources :categories, only: [:show]
  resources :users, only: %i[new create]
  resources :carts, only: %i[show]
  resources :cart_items, only: %i[create]
  resource :session, only: %i[new destroy]
  # get 'savedlists/show'
  # get 'products/index'
  # get 'products/new'
  # get 'products/edit'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
