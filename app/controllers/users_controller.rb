class UsersController < ApplicationController
  
  before_action :authorization, only: %i[show edit]
  
  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.savedlist_id = @currentUserSavedlist.id
      @user.cart_id = Cart.create().id
      @user.save
      session[:user_id] = @user.id
      
      # current_user
      
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
    @user = User.find(params[:id])
    @newsletterTurnedOn = Newsletter.find_by(email: @user.email)
  end
  
  def edit
  end
  
  def update
    user = current_user
    
    if !params[:newEmail].blank?
      user.email = params[:newEmail]
    end
    
    if !params[:newPassword].blank?
      user.password = params[:newPassword]
      user.password_confirmation = params[:newPasswordConfirmation]
    end
    
    if user.valid?
      user.save
      redirect_to user_path(user), success: "Password Changed Successfully"
    else
      redirect_to edit_user_path(user.id), danger: "Passwords do no match!"
    end
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
