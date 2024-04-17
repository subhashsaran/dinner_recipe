require 'rails_helper'

module Recipes
  RSpec.describe FindRecipesWithIngredients, type: :service do
    subject(:recipes) { described_class.new(ingredients).call }

    let(:ingredients) { 'egg, flour, milk' }

    describe '#call' do
      context 'when ingredients are present' do
        let!(:recipe1) { create(:recipe) }
        let!(:recipe2) { create(:recipe) }
        let!(:ingredient1) { create(:ingredient, name: 'egg') }
        let!(:ingredient2) { create(:ingredient, name: 'flour') }
        let!(:ingredient3) { create(:ingredient, name: 'sugar') }

        before do
          recipe1.ingredients << ingredient1
          recipe1.ingredients << ingredient2
          recipe2.ingredients << ingredient2
          recipe2.ingredients << ingredient3
        end

        it 'returns recipes with matching ingredients' do
          expect(recipes).to match_array([recipe1, recipe2])
        end

        it 'returns unique recipes' do
          expect(recipes.uniq.count).to eq(recipes.count)
        end
      end

      context 'when no ingredients are provided' do
        let(:ingredients) { '' }

        it 'returns an empty array' do
          expect(recipes).to eq([])
        end
      end

      context 'when there are no matching recipes' do
        let!(:ingredient) { create(:ingredient, name: 'cheese') }

        it 'returns an empty array' do
          expect(recipes).to eq([])
        end
      end
    end
  end
end
