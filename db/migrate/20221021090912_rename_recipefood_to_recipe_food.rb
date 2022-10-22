class RenameRecipefoodToRecipeFood < ActiveRecord::Migration[7.0]
  def change
     rename_table :recipefoods, :recipe_food
  end
end
