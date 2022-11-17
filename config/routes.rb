Rails.application.routes.draw do
  
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
end

devise_for :users
  resources :recipe_foods
  resources :recipes
  resources :foods
  resources :public_recipes



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "public_recipes#index"

end
