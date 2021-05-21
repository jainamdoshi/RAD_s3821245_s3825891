class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorization, only: %i[show edit]
  
  def new
     @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.savedlist_id = @currentUserSavedlist.id
      @user.cart_id = Cart.create().id
      @user.save
      session[:user_id] = @user.id
      current_user
      redirect_to root_path, success: "Thank you for Signing Up!"
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
  
  def forget_password
    
  end 
  
  def forgetpasswordupdate
    emailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    emailAddress = params[:email]
    
    if (emailAddress.match(emailRegex)) && (User.find_by(email: emailAddress))
        UserNotifierMailer.send_forget_password_email(emailAddress).deliver
        #TODO put the URI thing here
        redirect_to root_path, success: "Email sent with forget password link!"
    else
      redirect_to users_forget_password_path, danger: "Invalid Email"
    end
  end
  
  def forgetpassword_edit
    user = User.find(params[:id])
    session[:user_id] = user.id
    savedlist_merge(user)
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
