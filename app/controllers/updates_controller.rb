class UpdatesController < ApplicationController

  def new   
  end

  def create
    if current_user
      @post = Post.find(params[:post_id])
      @update = @user.posts.updates.create(update_params)
      redirect_to post_path(@post)
    else
      redirect_to 'users/login'
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
    def update_params
      params.require(:update).permit(:poster, :text)
    end

end
