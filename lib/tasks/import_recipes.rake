namespace :recipes do
  desc "Import Recipes from JSON file"
  task import: :environment do
    file_path = Rails.root.join("tmp", "recipes-en.json")
    file_content = File.read(file_path)
    json_data = JSON.parse(file_content)

    Recipes::Import.new(json_data).call
  end
end
