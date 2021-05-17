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
end
