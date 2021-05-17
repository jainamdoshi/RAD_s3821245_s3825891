class User < ApplicationRecord
    has_one :savedlist
    has_one :cart
    before_save { self.email = email.downcase }
    
    validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: { maximum: 25 }
    validates :password, presence: true, length: { minimum: 8, maximum: 20 }, format: { with: /\A[a-z0-9]+\z/i }
    
    has_secure_password
    
    def self.find_or_create_from_auth_hash(auth_hash)
        user = User.new({:name => auth_hash.info.name, :email => "#{auth_hash.uid}@gmail.com", 
        :password => auth_hash.credentials.secret, :password_confirmation => auth_hash.credentials.secret})
        
        user
        #user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
        # user.update(
        #   name: auth_hash.info.nickname,
        #   id: auth_hash.uid,
        #   token: auth_hash.credentials.token,
        #   secret: 
        # )
        # user
    end
end
