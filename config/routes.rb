Rails.application.routes.draw do
  get "/", to: "books#index"
  resources :books
end
