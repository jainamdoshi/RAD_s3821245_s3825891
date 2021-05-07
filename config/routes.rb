Rails.application.routes.draw do
  
  root 'home#index'
  get 'categories/:id', to: "categories#show", as: "category"
  get 'products/index', to: 'products#index'
  
  get 'savedlists/show', to: "savedlists#show", as: "savedlist"
  post 'savedlists/update', to: "savedlists#update", as: "savedlist_update"
  # get 'savedlists/:id', to: "savedlists#show", as: "savedlist"
  get 'products/index', to: "products#index"
  get 'products/create', to: "products#create"
  get 'products/:id', to: "products#show", as: "product"
  
  # delete 'savedlists/:id/', to: "savedlists#destroy" as 
  
  # get 'savedlists/show'
  # get 'products/index'
  # get 'products/new'
  # get 'products/edit'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
