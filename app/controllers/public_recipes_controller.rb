class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
    @recipes = Recipe.includes(%i[user recipe_foods])
  end
end
