class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(strong_params)
    @recipe.user = current_user
    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'Recipe saved successfully'
          redirect_to recipes_url
        else
          flash.now[:error] = 'Error: Recipe could not be saved'
          render :new, locals: { recipe: @recipe }
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = 'The recipe was successfully deleted.'
    redirect_to recipes_path
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.toggle(:public)
    @recipe.save
  end

  private

  def strong_params
    params.require(:recipe).permit(:user_id, :name, :description, :preparation_time, :cooking_time, :public)
  end
end
