class CartItemsController < ApplicationController
    def create
        
        stock = Stock.find_by(product_id: params[:product_id], colour: params[:colour], size: params[:size])
        
        puts stock.quantity
        
        if stock.quantity >= params[:itemQuantity].to_i
            puts "##########################################################################3"
            cart_item = CartItem.new(stock_id: stock.id, quantity: params[:itemQuantity].to_i)
            if cart_item.save
                cart = Cart.find(User.find(session[:user_id]).cart_id)
                cart << cart_item
            end
            
            puts cart.cart_items.first.quantity
            redirect_to product_path(params[:product_id]), success: "Added #{params[:itemQuantity]} item(s) of size: #{params[:size]} and colour #{params[:colour]}"
        else
            redirect_to product_path(params[:product_id]), danger: "Not enough item(s) of size: #{params[:size]} and colour #{params[:colour]}"
        end
    end
end
