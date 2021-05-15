class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      cookies[:savedlist_id] = user.savedlist_id
      redirect_to root_path, success: 'Logged in!'
    else
      render :new, error: 'Email or password is invalid'
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path, success: 'Logged out!'
  end

end
