class RecipefoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.find_by(@recipe).includes(:food)
  end
end
