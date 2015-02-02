class FriendshipsController < ApplicationController

  def send_request
    user = User.find(params[:friend_id])
    if current_user.has_no_friendship_with?(user)
      friendship = Friendship.new(user_id: current_user.id, friend_id: user.id)
      if friendship.save
        redirect_to notifications_friend_requests_path, notice: 'Your friend request was send.'
      end
    end
  end

  def accept_request
    user = User.find(params[:friend_id])
    if current_user.has_request_from?(user)
      f1 = Friendship.where(user_id: user.id, friend_id: current_user.id).first
      f2 = Friendship.new(user_id: current_user.id, friend_id: user.id, accepted: true)
      if f2.save
        f1.update(accepted: true)
        redirect_to notifications_friend_requests_path, notice: 'You are now friends with ' + User.find(user.id).decorate.name + '.'
      end
    end
  end

  def cancel_request
    user = User.find(params[:friend_id])
    if current_user.has_send_request_to?(user)
      friendship = Friendship.find_by(user_id: current_user.id, friend_id: user.id)
      if friendship.destroy
        redirect_to notifications_friend_requests_path, notice: "Your friend request to #{user.first_name} #{user.last_name} has been deleted."
      end
    end
  end

  def discard_request
    user = User.find(params[:friend_id])
    if current_user.has_request_from?(user)
      friendship = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
      if friendship.destroy
        redirect_to notifications_friend_requests_path, notice: "You have discarded friend request from #{user.first_name} #{user.last_name}"
      end
    end
  end

  def delete_friend
    user = User.find(params[:friend_id])
    if current_user.is_fully_friends_with?(user)
      f1 = Friendship.find_by(user_id: current_user.id, friend_id: user.id)
      f2 = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
      if f1.destroy && f2.destroy
        redirect_to notifications_friend_requests_path, notice: "You are not friends anymore with #{user.first_name} #{user.last_name}."
      end
    end
  end

end