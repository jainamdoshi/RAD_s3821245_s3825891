class CartItemsController < ApplicationController
    
    before_action :authorization, only: [:create]
    
    def create
        puts "Reached here --------------"
        # stock = Stock.find_by(product_id: params[:product_id], colour: params[:colour], size: params[:size])
        # if stock && stock.quantity >= params[:itemQuantity].to_i
        if add_items_to_cart(params[:product_id], params[:size], params[:colour], params[:itemQuantity])
        #     cart_item = CartItem.new(stock_id: stock.id, quantity: params[:itemQuantity].to_i)
        #     if cart_item.save
        #         cart = Cart.find(current_user().cart_id)
        #         cart.cart_items << cart_item
        #         product = Product.find(stock.product_id).score += params[:itemQuantity].to_i
        #         product.save
                #   redirect_to product_path(params[:product_id]), success: "Added #{params[:itemQuantity]} item(s) of size: #{params[:size]} and Colour: #{params[:colour]}"
        #     end
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
        # cart_items_path(:product_id =>request.params[:product_id], :colour =>request.params[:colour], :size =>request.params[:size], :itemQuantity =>request.params[:itemQuantity])
        if session[:user_id].blank?
            puts "----------#{request.params}-------------"
            session[:pending_items] = request.params
            redirect_to new_session_path
        end
    end
end
