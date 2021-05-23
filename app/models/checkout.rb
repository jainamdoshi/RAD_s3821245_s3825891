class Checkout < ApplicationRecord
    def getProducts
        Product.find(CartItem.find(self.cart_items_id).product_id)
    end
    
    def getQuantity
        CartItem.find(self.cart_items_id).quantity
    end
end
