class ShoppingController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe_foods = RecipeFood
      .joins(:recipe)
      .group('food_id')
      .select('food_id, sum(quantity) as quantity')
      .where(recipes: { user: current_user })
  end
end
