class CartsController < ApplicationController
  
  before_action :authorization, only: [:show]
  
  def show
  end
  
  private
  
  def authorization
    if session[:user_id].blank?
      redirect_to new_session_path
    end
  end
  
end
