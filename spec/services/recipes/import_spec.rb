require 'rails_helper'

module Recipes
  RSpec.describe Import, type: :service do
    subject(:import) { described_class.new(file_data).call }

    let(:json_file) { Rails.root.join("spec", "fixtures", "valid_recipes.json") }
    let(:file_content) { File.read(json_file) }
    let(:file_data) { JSON.parse(file_content) }

    describe '#call' do
      context 'when data is valid' do
        it 'creates recipes records' do
          expect { import }.to change(Recipe, :count).by(2)
        end

        it 'creates unique ingredient records' do
          expect { import }.to change(Ingredient, :count).by(15)
        end
      end

      context 'when data is invalid' do
        let(:json_file) { Rails.root.join("spec", "fixtures", "invalid_recipes.json") }

        it 'ActiveRecord::RecordInvalid exception is raised' do
          expect { import }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
