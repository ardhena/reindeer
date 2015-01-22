class NotificationsController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:unaccepted_requests_to_current_user, decorator: UserDecorator, collection: true) {
    current_user.unaccepted_friends_requested_to_self
  }
  expose_decorated(:unaccepted_requests_from_current_user, decorator: UserDecorator, collection: true) {
    current_user.unaccepted_friends_requested_by_self
  }
  expose_decorated(:accepted_friends, decorator: UserDecorator, collection: true) {
    current_user.accepted_friends
  }

  def friend_requests
  end

end