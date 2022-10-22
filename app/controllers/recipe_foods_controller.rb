class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user: current_user)
    @food = Food.find_by(id: @recipe_food.food_id)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.new(strong_params)
    @recipe_foods.recipe = @recipe
    respond_to do |format|
      if @recipe_foods.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe Food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_foods }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_foods.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.find_by(recipe_id: @recipe.id)
    @recipe_food.destroy
    flash[:success] = 'The recipe food was successfully deleted.'
    redirect_to recipe_path
  end

  private

  def strong_params
    params.require(:recipe_food).permit(:food_id, :quantity, :recipe_id)
  end
end
