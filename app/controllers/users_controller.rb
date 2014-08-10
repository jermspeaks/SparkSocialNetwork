class UsersController < ApplicationController
  include ApplicationHelper
  def show
    @user = User.find(params[:id])
    @users = User.all - @user.friends.all - [@user] - @user.receivers.all
    @requests = @user.requests.all
    @photo = Photo.new
    @post = Post.new
  end


  def send_request
    current_user
    if @current_user
      new_request = FriendRequest.new(user_id: params[:receiver_id], requester_id: @current_user.id)
      respond_to do |format|
      if new_request.save
        format.json { render json: {message: "success"} }
        format.html
      else
        format.json { render json: {message: "fail"} }
        format.html
      end
    end
    else
      nil
    end
  end

  def accept_request
    current_user
    if @current_user
      @current_user.accept_request(params[:requester_id])
      format.json { render json: {message: "success"} }
      format.html
    else
      nil
    end
  end

  def reject_request
    current_user
    if @current_user
      @current_user.reject_request(params[:requester_id])
      format.json { render json: {message: "success"} }
      format.html
    else
      nil
    end
  end

  def friends
    @user = User.find(params[:user_id])
    if @user
      render 'friends'
    else
      redirect_to '/'
    end
  end

  def new
    current_user
    if @current_user
      redirect_to '/feed'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user).deliver

      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy!

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
