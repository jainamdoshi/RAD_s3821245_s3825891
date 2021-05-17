  class CartsController < ApplicationController
  
    before_action :authorization, only: [:show]
  
    def show
      @cart = @current_cart
    end
  
    private
    def authorization
      if session[:user_id].blank?
        redirect_to new_session_path
      else
        cart = User.find_by(:id => session[:user_id]).cart_id
        if cart.present?
          @current_cart = Cart.find_by(:id => cart)
        end
      end
    end
  end
