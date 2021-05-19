class UsersController < ApplicationController
  
  before_action :authorization, only: [:show]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.savedlist_id = @currentUserSavedlist.id
      @user.cart_id = Cart.create().id
      @user.save
      session[:user_id] = user.id
      
      current_user
      
      if session[:return_to].blank?
        redirect_to root_path, success: "Thank you for Signing Up!"
      else
        redirect_to session.delete(:return_to), success: "Thank you for Signing Up!"
      end
    else
      redirect_to new_user_path, danger: "Invalid Username or Password! Please try again."
    end
  end
  
  def show
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def authorization
      if session[:user_id].blank?
        redirect_to new_session_path
      else
        if current_user().id != params[:id].to_i
          redirect_to user_path(current_user().id)
        end
      end
    end
end
