class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.time :preparation_time
      t.time :cooking_time
      t.string :description
      t.string :text
      t.string :public
      t.string :boolean

      t.timestamps
    end
  end
end
