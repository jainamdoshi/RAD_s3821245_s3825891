class ApplicationController < ActionController::Base

    
    before_action :addingSavedlistCookies
    add_flash_types :danger, :success
    
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :current_user
    
    
    
    def isProductInSavedlist(product)
      @currentUserSavedlist.products.find_by(id: product.id) ? true : false
    end
    
    def current_user
        if !session[:user_id].blank?
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
        @current_user
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
    end

    def logged_in?
        current_user
    end
end