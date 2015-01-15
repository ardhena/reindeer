class FriendshipsController < ApplicationController

  def send_request
    friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])
    unless current_user.has_friendship_with(User.find(params[:friend_id]))
      if friendship.save
        redirect_to profile_path(params[:friend_id]), notice: 'Your friend request was send.'
      end
    end
  end

  def accept_request
    friendship = current_user.friendship_with(User.find(params[:friend_id]))
    if friendship && !friendship.accepted?
      friendship.update(accepted: true)
      redirect_to profile_path(params[:friend_id]), notice: 'You are now friends with ' + User.find(params[:friend_id]).decorate.name + '.'
    end
  end

end