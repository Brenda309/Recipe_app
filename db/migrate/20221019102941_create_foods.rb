class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.float :price
      t.string :quantity

      t.timestamps
    end
  end
end