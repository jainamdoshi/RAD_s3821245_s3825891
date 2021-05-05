Rails.application.routes.draw do
  root 'products#index'
  
  get 'savedlists/:id', to: "savedlists#show"
  get 'products/:id', to: "products#index"
  delete 'savedlists/:id', to: "savedlists#destroy"
  
  # get 'savedlists/show'
  # get 'products/index'
  # get 'products/new'
  # get 'products/edit'
  # resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
