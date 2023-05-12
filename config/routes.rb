Rails.application.routes.draw do
  devise_for :users

  get '/inventories', to: 'inventories#index', as: 'inventories'
  get '/inventories/:id', to: 'inventories#show', as: 'inventory'

  resources :inventories, only: [:index, :show, :create, :destroy]

  resources :recipes do
    resources :recipe_foods, path: 'food', only: [:destroy, :new, :create]
  end

  resources :foods
  resources :public_recipes

  # Define the root path route ("/")
  root 'public_recipes#index'
end
