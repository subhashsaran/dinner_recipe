require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:ingredient_recipes) }
    it { is_expected.to have_many(:recipes).through(:ingredient_recipes) }
  end

  describe "validations" do
    subject { build(:ingredient) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
