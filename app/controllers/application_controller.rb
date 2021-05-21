class ApplicationController < ActionController::Base

    
    before_action :addingSavedlistCookies
    add_flash_types :danger, :success
    
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :current_user
    
    
    
    def isProductInSavedlist(product)
      @currentUserSavedlist.products.find_by(id: product.id) ? true : false
    end
    
    def current_user
        if !session[:user_id].blank?
            current_user ||= User.find(session[:user_id])
        else
            current_user = nil
        end
        current_user
    end
    
    private
    def addingSavedlistCookies
        if (cookies[:savedlist_id].blank?)
            savedlist = Savedlist.create()
            cookies.permanent[:savedlist_id] = savedlist.id
            @currentUserSavedlist = savedlist
        else
            @currentUserSavedlist = Savedlist.find(cookies[:savedlist_id])
        end
    end

    def logged_in?
        current_user
    end
    
    def add_items_to_cart(productId, sizeP, colourP, itemQuantityP)
        stock = Stock.find_by(product_id: productId, colour: colourP, size: sizeP)
        # stock = Stock.find_by(product_id, colour, size)
        if stock && stock.quantity >= itemQuantityP.to_i
            cart_item = CartItem.new(stock_id: stock.id, quantity: itemQuantityP.to_i)
            if cart_item.save
                cart = Cart.find(current_user().cart_id)
                cart.cart_items << cart_item
                product = Product.find(stock.product_id)
                product.score += itemQuantityP.to_i
                product.save
                return true
            end
        end
        return false
    end
    
    def savedlist_merge(user)
      Savedlist.find(user.savedlist_id) + Savedlist.find(cookies[:savedlist_id])
      if cookies[:savedlist_id] != user.savedlist_id
        cookies[:savedlist_id] = user.savedlist_id
      end
    end
end