class AddFoodRefToRecipefoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipefoods, :food, null: false, foreign_key: true
  end
end
