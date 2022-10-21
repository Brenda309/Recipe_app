class ShoppinglistController < ApplicationController
  def index
    @foods = Food.where(user: current_user)
    recipes = Recipe.where(user: current_user)
    @recipefoods = Recipefood.where(recipe: recipes)
    @shoppinglist = {}
    @prices = {}
    @total_quantity = 0
    @total_value = 0

    @recipefoods.each do |recipefood|
      @foods.each do |food|
        next unless food.name == recipefood.food.name

        @shoppinglist[food.name] = if @shoppinglist[food.name]
                                     @shoppinglist[food.name] - recipefood.quantity
                                   else
                                     food.quantity - recipefood.quantity
                                   end
        @prices[food.name] = food.price
        if @shoppinglist[food.name].negative?
          @total_quantity += @shoppinglist[food.name]
          @total_value += @shoppinglist[food.name] * food.price
        end
      end
    end
  end
end
