Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admins
  root 'pages#home'
end
