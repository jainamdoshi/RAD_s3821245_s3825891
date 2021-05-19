  class CartsController < ApplicationController
  
    before_action :authorization, only: [:show]
  
    def show
      @cart = Cart.find(params[:id])
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
        if current_user().cart_id != params[:id].to_i
          redirect_to cart_path(current_user().cart_id)
        end
      end
    end
  end
