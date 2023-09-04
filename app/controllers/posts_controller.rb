class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
      else
        format.html do
          flash[:post_errors] = @post.errors.full_messages
          redirect_to root_path
        end
      end
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
  end

  private

    def post_params
      params.require(:post).permit(:body)
    end
end
