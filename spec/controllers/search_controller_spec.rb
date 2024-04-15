# spec/controllers/search_controller_spec.rb
require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #index' do
    context 'when ingredients are present' do
      let!(:recipe1) { create(:recipe, title: "Pancakes") }
      let!(:recipe2) { create(:recipe, title: "Omelette") }
      let!(:ingredient1) { create(:ingredient, name: 'egg') }
      let!(:ingredient2) { create(:ingredient, name: 'flour') }
      let!(:ingredient3) { create(:ingredient, name: 'milk') }

      before do
        recipe1.ingredients << ingredient1
        recipe1.ingredients << ingredient2
        recipe1.ingredients << ingredient3

        recipe2.ingredients << ingredient1
      end

      it 'assigns @recipes with matching ingredients' do
        get :index, params: { ingredients: 'egg, flour, milk' }
        expect(assigns(:recipes)).to match_array([recipe1, recipe2])
      end

      it 'renders the index template' do
        get :index, params: { ingredients: 'egg, flour, milk' }
        expect(response).to render_template('index')
      end
    end

    context 'when no ingredients are provided' do
      it 'redirects to root path' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when there are no matching recipes' do
      let!(:recipe) { create(:recipe) }
      let!(:ingredient) { create(:ingredient, name: 'cheese') }

      before do
        recipe.ingredients << ingredient
      end

      it 'assigns an empty @recipes' do
        get :index, params: { ingredients: 'egg, flour, milk' }
        expect(assigns(:recipes)).to be_empty
      end

      it 'renders the index template' do
        get :index, params: { ingredients: 'egg, flour, milk' }
        expect(response).to render_template('index')
      end
    end
  end
end
