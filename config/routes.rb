Rails.application.routes.draw do
  devise_for :users

  get '/inventories', to: 'inventories#index', as: 'inventories'
  get '/inventories/:id', to: 'inventories#show', as: 'inventory'

  resources :inventories, only: [:index, :show, :create, :destroy]

  resources :recipes do
    resources :recipe_foods, path: 'food', only: [:destroy, :new, :create]
  end

  match 'recipes/:recipe_id' => 'recipes#toogle_public', as: :toogle_public, via: :patch
  match 'public_recipes' => 'public_recipes#index', as: :public_recipes, via: :get

  get 'shopping_list', to: "shopping_list#index"

  resources :foods
  resources :public_recipes

  # Define the root path route ("/")
  root 'public_recipes#index'
end
