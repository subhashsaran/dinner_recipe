FactoryBot.define do
  factory :recipe do
    title { "Golden Sweet Cornbread" }
    cook_time { 25 }
    prep_time { 10 }
    ratings { 4.74 }
    image_url { "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2021%2F10%2F26%2Fcornbread-1.jpg" }
    category { "Cornbread" }
    author { "bluegirl" }
  end
end
