Rails.application.routes.draw do

devise_for :users, sign_out_via: [:get, :post]

get '/public_recipes', to: 'recipes#public'
resources :foods 
  resources :users, only: [:index]
  resources :shopping_list
  resources :recipes, only: [:index, :new, :show, :destroy, :create]
    resources :recipe_foods
  

  root to: "recipes#public"

end
