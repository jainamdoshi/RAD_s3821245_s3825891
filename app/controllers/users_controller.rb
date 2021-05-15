class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    puts "Reached here !!!"
    if @user.save
      puts "Reached after if !!"
      @user.savedlist_id = @currentUserSavedlist.id
      @user.cart_id = Cart.create().id
      redirect_back fallback_location: root_path, success: 'Thank you for Signing Up!'
      # redirect_to root_path, success: "Thank you for Signing Up!"
    else
      puts "Reached in else !!!"
      redirect_to new_user_path, danger: "Invalid Username or Password! Please try again."
    end
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
