Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admins
  devise_scope :admin do
    get 'admins/sign_out' => "devise/sessions#destroy"
  end

  devise_for :users
  get 'my_profile', to: 'profiles#my_profile', as: 'my_profile'
  get 'my_profile/friends', to: 'profiles#friends'
  get 'my_profile/edit', to: 'profiles#edit', as: 'edit_my_profile'
  patch 'my_profile', to: 'profiles#update'
  resources :profiles, only: [:show, :index]
  post 'profiles', to: 'profiles#index'

  get 'notifications/friend_requests', to: 'notifications#friend_requests'

  get 'send_friend_request', to: 'friendships#send_request', as: 'send_friend_request'
  get 'accept_friend_request', to: 'friendships#accept_request', as: 'accept_friend_request'
  get 'cancel_friend_request', to: 'friendships#cancel_request', as: 'cancel_friend_request'
  get 'discard_friend_request', to: 'friendships#discard_request', as: 'discard_friend_request'
  get 'delete_friend', to: 'friendships#delete_friend', as: 'delete_friend'

  get 'message_box', to: 'message_box#index'
  get 'inbox', to: 'message_box#inbox'
  get 'outbox', to: 'message_box#outbox'

  root 'pages#home'
  resources :articles, only: [:index, :show]
  resources :news, only: [:index, :show]
  get 'pages/about', as: 'about'

  resources :comments, only: [:new, :create]
  get '/comments/cancel', to: 'comments#cancel', as: 'cancel_comment'
end
