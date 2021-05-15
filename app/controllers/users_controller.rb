class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = Customer.new(customer_params)
    if @user.save
      @user.savedlist_id = @currentUserSavedlist.id
      redirect_to root_path, success: "Thank you for Signing Up!"
    else
      render 'new', error: "Invalid Username or Password! Please try again."
    end
  end
  
  
  private
    def customer_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
