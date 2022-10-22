class PublicRecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    flash[:success] = 'The recipe was deleted.'
    redirect_to recipes_path
  end
end
