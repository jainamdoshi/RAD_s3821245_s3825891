class CartItemsController < ApplicationController
    
    before_action :authorization, only: [:create]
    
    def create
        stock = Stock.find_by(product_id: params[:product_id], colour: params[:colour], size: params[:size])
        if stock && stock.quantity >= params[:itemQuantity].to_i
            cart_item = CartItem.new(stock_id: stock.id, quantity: params[:itemQuantity].to_i)
            if cart_item.save
                cart = Cart.find(current_user().cart_id)
                cart.cart_items << cart_item
                product = Product.find(stock.product_id).score += quantity
                product.save
            end
            redirect_to product_path(params[:product_id]), success: "Added #{params[:itemQuantity]} item(s) of size: #{params[:size]} and Colour: #{params[:colour]}"
        else
            redirect_to product_path(params[:product_id]), danger: "Not enough item(s) of size: #{params[:size]} and colour #{params[:colour]}"
        end
    end
    
    def destroy
        puts "destroy"
    end
    
    private
    def authorization
        if session[:user_id].blank?
            redirect_to new_session_path
        end
    end
end
