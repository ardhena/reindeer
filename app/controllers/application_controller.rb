class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  expose(:new_messages) { current_user.new_messages }
  expose(:new_friend_requests) { current_user.new_friend_requests }

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :sex << :birth << :country << :school << :city
  end

  protect_from_forgery with: :exception
end
