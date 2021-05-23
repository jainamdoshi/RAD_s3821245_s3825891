class Checkout < ApplicationRecord
    def get_user_items
        return Product.find_by(product_id: CartItem.find_by(self.cart_items_id).product_id)
    end
end
