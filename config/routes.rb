Rails.application.routes.draw do

  get ':user_id', to: 'profiles#show', as: :profile
  get ':user_id/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_id/edit', to: 'profiles#update', as: :update_profile

  get 'browse', to: 'images#browse', as: :browse_posts


  get 'relationships/follow_user'
  get 'relationships/unfollow_user'

  mount ActionCable.server => '/cable'


  get '/my_conversations', to: 'conversations#index', as: 'my_conversations'

  #root 'posts#index'
  root 'images#index'

  get '/my_images', to: 'images#my_images', as: 'my_images'
  get '/user_profiles/:id', to: 'users#profiles', as: 'user_profiles'

  post ':user_id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user


  devise_for :users

  resources :posts
  resources :images do
    resources :comments
  end

  resources :personal_messages, only: [:create]
  resources :conversations, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

end
