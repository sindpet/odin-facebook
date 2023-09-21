class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts_liked_by_current_user = Post.where(user_id: params[:id])
                                    .includes(:likes).where(likes: { user_id: current_user.id}).pluck(:id)
  end
end
