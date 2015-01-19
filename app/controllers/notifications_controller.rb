class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  expose_decorated(:requests_from, decorator: UserDecorator, collection: true) { current_user.unaccepted_friends_requests }
  expose_decorated(:requests_to, decorator: UserDecorator, collection: true) { current_user.unaccepted_friends_initiated_by_self }
   
  def index
  end
  
end