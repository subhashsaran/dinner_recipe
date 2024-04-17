class CreateIngredientRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredient_recipes do |t|
      t.references :recipe, null: false, foreign_key: true, index: true
      t.references :ingredient, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
