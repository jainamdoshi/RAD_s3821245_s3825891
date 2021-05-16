class User < ApplicationRecord
    has_one :savedlist
    has_one :cart
    before_save { self.email = email.downcase }
    
    # validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    # validates :name, presence: true, length: { maximum: 25 }
    # validates :password, presence: true, length: { minimum: 8, maximum: 20 }, format: { with: /\A[a-z0-9]+\z/i }
    
    has_secure_password
end
