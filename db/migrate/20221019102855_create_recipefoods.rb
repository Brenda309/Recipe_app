class CreateRecipefoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipefoods do |t|
      t.float :quantity

      t.timestamps
    end
  end
end
