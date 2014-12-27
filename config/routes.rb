Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admins
  devise_scope :admin do
    get 'admins/sign_out' => "devise/sessions#destroy"
  end

  devise_for :users
  get 'my_profile', to: 'profiles#my_profile', as: 'my_profile'
  resources :profiles, only: [:edit, :show]

  root 'pages#home'
  resources :articles, only: [:index, :show]
  resources :news, only: [:index, :show]
  get 'pages/about', as: 'about'

  resources :comments, only: [:new, :create]
  get '/comments/cancel', to: 'comments#cancel', as: 'cancel_comment'
end
