class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    user = User.find_by_email(@user.email)
    if user && user.authenticate(@user.password)
      session[:user_id] = user.id
      # Method call
      savedlist_merge(user)
      current_user
      if session[:return_to].blank?
        redirect_to root_path, success: 'Logged In!'
      else
        redirect_to session.delete(:return_to), success: 'Logged In!'
      end
      
    else
      redirect_to new_session_path, danger: 'Email or password is invalid'
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  
  def twittercreate
    @user = User.find_or_create_from_auth_hash(auth_hash)
    
    if(!User.find_by_email(@user.email))
       @user.savedlist_id = @currentUserSavedlist.id
       @user.cart_id = Cart.create().id
       @user.save
    else
      @user = User.find_by_email(@user.email)
    end
    session[:user_id] = @user.id
    savedlist_merge(@user)
    current_user
    redirect_to root_path, success: "Successfully Logged In!"
  end
  
  def self.sweep(time = 1.minute)
        if time.is_a?(String)
          time = time.split.inject { |count, unit| count.to_i.send(unit) }
        end

        where("updated_at < ?", time.ago.to_s(:db)).delete_all
  end
  
  protected
 
  def auth_hash
    request.env['omniauth.auth']
  end


private
    def user_params
      params.require(:user).permit(:email, :password)
    end
    
    def savedlist_merge(user)
      Savedlist.find(user.savedlist_id) + Savedlist.find(cookies[:savedlist_id])
      if cookies[:savedlist_id] != user.savedlist_id
        cookies[:savedlist_id] = user.savedlist_id
      end
    end

end
