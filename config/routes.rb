Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  devise_for :admins
  devise_scope :admin do
    get 'admins/sign_out' => "devise/sessions#destroy"
  end

  root 'pages#home'
  resources :articles, only: [:index, :show]
  resources :news, only: [:index, :show]
  get 'pages/about', as: 'about'
  get 'my_profile', to: 'profiles#my_profile', as: 'my_profile'
  resources :comments, only: [:new, :create]
  get '/comments/cancel', to: 'comments#cancel', as: 'cancel_comment'
end
