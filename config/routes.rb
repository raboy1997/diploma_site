Rails.application.routes.draw do

  mount ActionCable.server => '/cable'


  get '/my_conversations', to: 'conversations#index', as: 'my_conversations'

  root 'images#index'

  get '/my_images', to: 'images#my_images', as: 'my_images'

  devise_for :users

  resources :images
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

end
