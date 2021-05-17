class CartsController < ApplicationController
  
  before_action :authorization, only: [:show]
  
  def show
    @cart = Cart.find(User.find(session[:user_id]).cart_id)
  end
  
  private
  
  def authorization
    if session[:user_id].blank?
      session[:return_to] ||= request.referer
      redirect_to new_session_path
    end
  end
  
end
