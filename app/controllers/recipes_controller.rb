class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes([:user])


  def show
    @recipe = Recipe.find(params[:id])
    @recipefoods = Recipefood.where(recipe_id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description))

    @recipe.user = current_user

    if @recipe.save
      flash[:success] = 'Recipe saved successfully'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Error: Recipe could not be saved'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy

    if recipe.destroy
      flash[:success] = 'Recipe deleted successfully'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Error: Recipe could not be deleted'
    end
  end
end
