module CartItemsHelper
    def getProductFromStock(stock_id)
        Product.find(Stock.find(stock_id).product_id)
    end
    
    def totalPrice(cart)
        price = 0
        
        cart.cart_items.each do |cart_item|
            price += getProductFromStock(cart_item.stock_id).price * cart_item.quantity
        end
        return price
    end

    def add_items_to_cart(product_id, size, colour, itemQuantity)
        stock = Stock.find_by(product_id, colour, size)
        if stock && stock.quantity >= itemQuantity.to_i
            cart_item = CartItem.new(stock_id: stock.id, quantity: itemQuantity.to_i)
            if cart_item.save
                cart = Cart.find(current_user().cart_id)
                cart.cart_items << cart_item
                product = Product.find(stock.product_id).score += itemQuantity.to_i
                product.save
                return true
            end
        end
        return false
    end
end
