class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.savedlist_id = @currentUserSavedlist.id
      @user.cart_id = Cart.create().id
      session[:user_id] = @user.id
      # redirect_back fallback_location: root_path, success: 'Thank you for Signing Up!'
      if(session[:return_to])
        redirect_to session.delete(:return_to), success: "Thank you for Signing Up!"
      else
        redirect_to root_path, success: "Thank you for Signing Up!"
      end
    else
      redirect_to new_user_path, danger: "Invalid Username or Password! Please try again."
    end
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
