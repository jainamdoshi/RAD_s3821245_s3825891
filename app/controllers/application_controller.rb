class ApplicationController < ActionController::Base
    before_action :addingSavedlistCookies
    add_flash_types :danger, :success
    
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?
    
    
    def isProductInSavedlist(product)
      return @currentUserSavedlist.products.find_by(id: product.id) ? true : false
    end
    
    private
    def addingSavedlistCookies
        
        if (cookies[:savedlist_id].blank?)
            savedlist = Savedlist.create()
            cookies.permanent[:savedlist_id] = savedlist.id
            @currentUserSavedlist = savedlist
        else
            @currentUserSavedlist = Savedlist.find(cookies[:savedlist_id])
        end
        
        # cookies[:name] = "Jainam"
    end
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user
    end
end