class Savedlist < ApplicationRecord
    has_and_belongs_to_many :products
    
    def +(other)
        other.products.each do |product|
            if (!self.products.find_by(id: product.id))
                self.products << product
            end
        end
    end
end
