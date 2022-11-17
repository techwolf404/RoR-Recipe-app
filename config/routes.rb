Rails.application.routes.draw do

devise_for :users, sign_out_via: [:get, :post]

get '/public_recipes', to: 'recipes#public'
resources :foods 
  resources :users, only: [:index]
  resources :recipes, only: [:index, :new, :show, :destroy, :create] do
    resources :recipe_foods
  end

  root to: "recipes#public"

end
