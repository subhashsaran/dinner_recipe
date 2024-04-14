class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end

    enable_extension "pg_trgm"

    add_index :ingredients, :name, using: :gin, opclass: :gin_trgm_ops, name: 'trgm_index_on_ingredients_name'
  end
end
