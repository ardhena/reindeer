class FriendshipsController < ApplicationController

  def send_request
    @user = User.find(params[:friend_id])
    if current_user.has_no_friendship_with?(@user)
      friendship = Friendship.new(user_id: current_user.id, friend_id: @user.id)
      if friendship.save
        redirect_to profile_path(@user.id), notice: 'Your friend request was send.'
      end
    end
  end

  def accept_request
    @user = User.find(params[:friend_id])
    if current_user.has_request_from?(@user)
      f1 = Friendship.where(user_id: @user.id, friend_id: current_user.id).first
      f2 = Friendship.new(user_id: current_user.id, friend_id: @user.id, accepted: true)
      if f2.save
        f1.update(accepted: true)
        redirect_to profile_path(@user.id), notice: 'You are now friends with ' + User.find(@user.id).decorate.name + '.'
      end
    end
  end

end