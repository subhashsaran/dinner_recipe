class Ingredient < ApplicationRecord
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
