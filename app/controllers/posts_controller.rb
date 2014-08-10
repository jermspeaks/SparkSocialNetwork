include PostsHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    current_user
    if @current_user
      new_post = Post.create(post_params)
      new_post.update(poster: @current_user)
      new_post.save
      redirect_to user_path(@current_user)
    else
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def post_params
      params.require(:post).permit(:status, :poster)
    end

end
