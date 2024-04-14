class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :cook_time, null: false
      t.integer :prep_time, null: false
      t.float :ratings
      t.string :image_url, null: false
      t.string :category
      t.string :author

      t.timestamps
    end
  end
end
