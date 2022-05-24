Rails.application.routes.draw do
  devise_for :users

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

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
