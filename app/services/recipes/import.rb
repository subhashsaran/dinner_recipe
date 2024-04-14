module Recipes
  class Import
    def initialize(data)
      @data = data
    end

    def call
      Recipe.transaction do
        data.each do |recipe_data|
          create_recipe(recipe_data)
        end
      end
    end

    private

    def create_recipe(recipe_data)
      recipe = Recipe.create!(
        title: recipe_data["title"],
        cook_time: recipe_data["cook_time"],
        prep_time: recipe_data["prep_time"],
        ratings: recipe_data["ratings"],
        image_url: recipe_data["image"],
        category: recipe_data["category"],
        author: recipe_data["author"]
      )

      recipe_data["ingredients"].map(&:downcase).each do |ingredient_name|
        ingredient = Ingredient.find_or_create_by(name: ingredient_name)
        recipe.ingredients << ingredient
      end
    end

    private

    attr_reader :data
  end
end
