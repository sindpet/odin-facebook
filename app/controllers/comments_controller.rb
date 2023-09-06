class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params.merge(user: current_user))
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.html do
          flash[:comment_errors] = @comment.errors.full_messages
          redirect_to post_path(@post)
        end
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.destroy
        format.turbo_stream
      else
        format.html do
          redirect_to post_path(@post), alert: "Comment could not be deleted"
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
