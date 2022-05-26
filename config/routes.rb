Rails.application.routes.draw do
  devise_for :users
  get 'public_recipes/index'
  get 'shopping_lists/index'

  resources :users do
    resources :foods
    resources :recipes
  end

  resources :recipes do
    resources :recipe_foods
  end

  resources :foods do
    resources :recipe_foods
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/public_recipes/index', to: 'public_recipes#index', as: :public_recipes
  get '/shopping_lists/index', to: 'shopping_lists#index', as: :shopping_lists


  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
