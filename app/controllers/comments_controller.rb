class CommentsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.update(commenter: @user)
    redirect_to post_path(@post)
  end

  def new
    @comment = Comment.new
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :text)
    end
end
