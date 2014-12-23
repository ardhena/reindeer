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
  resources :profiles
  resources :comments, only: [:new, :create, :destroy]
  get '/comments/cancel', to: 'comments#cancel', as: 'cancel_comment'
end
