Rails.application.routes.draw do
  get 'inventories/index'
  get 'inventories/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 root "users#index"
end
