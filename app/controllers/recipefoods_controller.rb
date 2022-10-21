# Class RecipefoodsController
class RecipefoodsController < ApplicationController
  def index; end

  def show; end

  def new
    @recipefood = Recipefood.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    @recipefood = Recipefood.new(params.require(:recipefood).permit(:quantity, :food_id))
    @recipefood.recipe = recipe

    if @recipefood.save
      flash[:success] = 'Ingredient saved successfully'
      redirect_to recipe_path(recipe)
    else
      flash.now[:error] = 'Error: Ingredient could not be saved'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipefood = Recipefood.find(params[:recipe_id])
    recipefood.destroy

    if recipefood.destroy
      flash[:success] = 'Ingredi'Ingredient'Ingredientent deleted successfully'
      redirect_to recipe_path(recipe.id)
    else
      flash.now[:error] = 'Error: Ingredient could not be deleted'
    end
  end

  def edit
    @recipefood = Recipefood.find(params[:recipe_id])
  end

  def update
    recipe = Recipe.find(params[:id])
    @recipefood = Recipefood.find(params[:recipe_id]).update(params.require(:recipefood).permit(:quantity, :food_id))
    redirect_to recipe_path(recipe)
  end
end
