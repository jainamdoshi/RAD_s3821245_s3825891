class Product < ApplicationRecord
    has_and_belongs_to_many :savedlists
    has_and_belongs_to_many :categories
end
