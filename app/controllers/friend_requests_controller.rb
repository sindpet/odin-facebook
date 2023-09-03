class FriendRequestsController < ApplicationController
  def send_friend_request
    friend_request = FriendRequest.create(friender_id: current_user.id, friendee_id: params[:id], status: false)

    redirect_to profile_path(params[:id])
  end

  def accept_friend_request
    friend_request = FriendRequest.find_by(friender_id: params[:id], friendee_id: current_user.id, status: false)
    friend_request.update(status: true)

    FriendRequest.create(friender_id: current_user.id, friendee_id: params[:id], status: true)

    redirect_to profile_path(params[:id])
  end

  def unfriend
    FriendRequest.find_by(friender_id: params[:id], friendee_id: current_user.id, status: true).destroy
    FriendRequest.find_by(friender_id: current_user.id, friendee_id: params[:id], status: true).destroy

    redirect_to profile_path(params[:id])
  end
end
