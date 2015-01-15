Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admins
  devise_scope :admin do
    get 'admins/sign_out' => "devise/sessions#destroy"
  end

  devise_for :users
  get 'my_profile', to: 'profiles#my_profile', as: 'my_profile'
  get 'my_profile/edit', to: 'profiles#edit', as: 'edit_my_profile'
  patch 'my_profile', to: 'profiles#update'
  resources :profiles, only: [:show, :index]
  post 'profiles', to: 'profiles#index'

  get 'send_friend_request', to: 'friendships#send_request', as: 'send_friend_request'
  get 'accept_friend_request', to: 'friendships#accept_request', as: 'accept_friend_request'

  root 'pages#home'
  resources :articles, only: [:index, :show]
  resources :news, only: [:index, :show]
  get 'pages/about', as: 'about'

  resources :comments, only: [:new, :create]
  get '/comments/cancel', to: 'comments#cancel', as: 'cancel_comment'
end
