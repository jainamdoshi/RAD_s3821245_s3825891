module UsersHelper
    
    def gravatar_for(user)
        image_tag("https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/8_avatar-512.png", alt: user.name, class:"gravatar")
    end
    
    def get_user_items(userID)
        Checkout.where(:user_id => userID)
    end
    
end
