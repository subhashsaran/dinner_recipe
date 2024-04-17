module Recipes
  class FindRecipesWithIngredients
    # @param ingredients [String]
    def initialize(ingredients)
      @ingredients = ingredients.split(', ').map(&:downcase)
    end

    def call
      return [] if ingredients.empty?

      subquery = Recipe.joins(:ingredients).where(ingredients_condition)

      Recipe.where(id: subquery).includes(:ingredients)
    end

    private

    attr_reader :ingredients

    def ingredients_condition
      conditions = ingredients.map { |ingredient| "ingredients.name ILIKE ?" }
      values = ingredients.map { |ingredient| "%#{ingredient}%" }
      [conditions.join(' OR '), *values]
    end
  end
end
