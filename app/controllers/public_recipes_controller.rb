class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
    @recipes = Recipe.includes([:user, :recipe_foods])
  end
end
