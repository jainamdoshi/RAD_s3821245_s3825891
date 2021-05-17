class Cart < ApplicationRecord
    has_and_belongs_to_many :cart_items
end
