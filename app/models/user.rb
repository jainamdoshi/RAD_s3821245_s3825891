class User < ApplicationRecord
    has_one :savedlist
    has_one :cart
    has_one :rating
    before_save { self.email = email.downcase }
    
    validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: { maximum: 25 }
    validates :password, presence: true, length: { minimum: 8, maximum: 20 }, format: { with: /\A[a-z0-9]+\z/i }
    
    has_secure_password
    
    def self.find_or_create_from_auth_hash(auth_hash)
        user = User.new({:name => auth_hash.info.name, :email => "#{auth_hash.uid}@gmail.com", 
        :password => auth_hash.credentials.secret[0..19], :password_confirmation => auth_hash.credentials.secret[0..19]})
        
        user
    end
    
    def get_saved_list_items
        Savedlist.find(self.savedlist_id).products
    end
    
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
end
