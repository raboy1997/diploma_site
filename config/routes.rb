Rails.application.routes.draw do

  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  mount ActionCable.server => '/cable'


  get '/my_conversations', to: 'conversations#index', as: 'my_conversations'

  root 'images#index'

  get '/my_images', to: 'images#my_images', as: 'my_images'
  get '/user_profiles/:id', to: 'users#profiles', as: 'user_profiles'

  post ':id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user


  devise_for :users

  resources :images
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

end
