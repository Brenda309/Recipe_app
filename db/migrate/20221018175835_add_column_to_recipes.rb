class AddColumnToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :name, :string
    add_column :recipes, :preparation_time, :time
    add_column :recipes, :cooking_time, :time
  end
end
