Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admins
  devise_scope :admin do
    get 'admins/sign_out' => "devise/sessions#destroy"
  end

  root 'pages#home'
end
