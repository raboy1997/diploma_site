Rails.application.routes.draw do


  root "images#index"
  resources :images
  get "/my_images", to: "images#my_images", as: "my_images"
  devise_for :users
end
