class AddColumnToRecipefoods < ActiveRecord::Migration[7.0]
  def change
    add_column :recipefoods, :quantity, :float
  end
end
