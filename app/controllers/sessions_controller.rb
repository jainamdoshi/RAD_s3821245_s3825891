class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    user = User.find_by_email(@user.email)
    if user&.authenticate(@user.password)
      session[:user_id] = user.id
      cookies[:savedlist_id] = user.savedlist_id
      # redirect_back fallback_location: root_path, success: 'Logged in!'
      redirect_to root_path, success: 'Logged in!'
    else
      redirect_to :new, error: 'Email or password is invalid'
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path, success: 'Logged out!'
  end

private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
