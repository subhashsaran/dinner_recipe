FactoryBot.define do
  factory :ingredient_recipe do
    association :ingredient, strategy: :build
    association :recipe, strategy: :build
  end
end
