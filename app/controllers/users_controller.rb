class UsersController < ApplicationController
  def index
    if params[:show] == "friends"
      @users = current_user.friends.includes(:profile_pic_attachment)
      friender_ids = FriendRequest.where(friendee: current_user, status: false).pluck(:friender_id)
      @friend_request_users = User.where(id: friender_ids)
    else
      @users = User.all.includes(:profile_pic_attachment)
    end
  end
end
