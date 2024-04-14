require 'rails_helper'

RSpec.describe IngredientRecipe, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:ingredient) }
    it { is_expected.to belong_to(:recipe) }
  end
end
