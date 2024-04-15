class SearchController < ApplicationController
  def index
    @recipes = Recipes::FindRecipesWithIngredients.new(
      search_params
    ).call
    rescue ActionController::ParameterMissing
      redirect_to root_path
  end

  def search_params
    params.require(:ingredients)
  end
end
