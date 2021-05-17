  class CartsController < ApplicationController
  
    before_action :authorization, only: [:show]
  
    def show
      @cart = @current_cart
    end
    
    def update
      cart = Cart.find(params[:id])
      cart.cart_items.each do |cart_item|
        stock = Stock.find(cart_item.stock_id)
        stock.quantity -= cart_item.quantity
        stock.save
        cart_item.delete
      end
      redirect_to root_path, success: "You have checked-out. Your items will arrive soon!"
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
