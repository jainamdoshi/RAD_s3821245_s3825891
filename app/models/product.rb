class Product < ApplicationRecord
    has_many :ppictures
    has_and_belongs_to_many :savedlists
    has_and_belongs_to_many :categories
    has_many :stocks
    has_and_belongs_to_many :product_tags
end
