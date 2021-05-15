class Savedlist < ApplicationRecord
    has_and_belongs_to_many :products
    has_one :user
end
