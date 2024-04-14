require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:ingredient_recipes) }
    it { is_expected.to have_many(:ingredients).through(:ingredient_recipes) }
  end
end
