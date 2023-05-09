Rails.application.routes.draw do
  get '/inventories', to: 'inventories#index', as: 'inventories'
  get '/inventories/:id', to: 'inventories#show', as: 'inventory'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :inventories, only: [:index, :show, :create, :destroy]
  # Defines the root path route ("/")
 root "users#index"
end
