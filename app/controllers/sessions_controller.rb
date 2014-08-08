class SessionsController < ApplicationController
  def new
  end

  def create
    data = params[:user]
    user = User.find_by(email: data[:email]).try(:authenticate, data[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to :root
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end

end
