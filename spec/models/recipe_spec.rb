require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:ingredient_recipes) }
    it { is_expected.to have_many(:ingredients).through(:ingredient_recipes) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:cook_time) }
    it { is_expected.to validate_presence_of(:prep_time) }
    it { is_expected.to validate_presence_of(:ratings) }
    it { is_expected.to validate_presence_of(:image_url) }
  end
end
