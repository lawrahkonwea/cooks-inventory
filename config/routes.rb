Rails.application.routes.draw do
  devise_for :users
  get '/inventories', to: 'inventories#index', as: 'inventories'
  get '/inventories/:id', to: 'inventories#show', as: 'inventory'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :inventories, only: [:index, :show, :create, :destroy]
  resources :recipes
  # Defines the root path route ("/")
  root 'users#index'
end
