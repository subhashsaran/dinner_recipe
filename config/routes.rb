Rails.application.routes.draw do
  resources :search, only: %i[index]
  root "home#index"
end
