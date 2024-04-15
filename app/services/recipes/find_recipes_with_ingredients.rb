module Recipes
  class FindRecipesWithIngredients
    # @param ingredients [String]
    def initialize(ingredients)
      @ingredients = ingredients.split(', ').map(&:downcase)
    end

    def call
      return [] if ingredients.empty?

      query = Recipe.joins(:ingredients)
      conditions = @ingredients.map { |ingredient| "ingredients.name ILIKE ?" }
      values = @ingredients.map { |ingredient| "%#{ingredient}%" }

      query.where(conditions.join(' OR '), *values).uniq
     end

    private

    attr_reader :ingredients
  end
end
