class User < ApplicationRecord
    belongs_to :savedlist
    belongs_to :cart
    before_save { email.downcase! }
    
    validates :email, presence: true, length: { maximum: 100 }, format: { with: @@emailRegex }, uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: { maximum: 25 }
    validates :password, presence: true, length: { minimum: 8, maximum: 20 }, format: { with: /\A[a-z0-9]+\z/i }
    
    has_secure_password
end
