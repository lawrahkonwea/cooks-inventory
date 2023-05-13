Rails.application.routes.draw do
  devise_for :users

 
  resources :inventories, only: [:index, :show, :destroy, :new, :create] do
    get 'foods/new', to: 'inventory_foods#new'
    post 'foods', to: 'inventory_foods#create'
    delete 'foods/:id', to: 'inventory_foods#destroy', as: 'food'
  end
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