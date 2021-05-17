class ApplicationController < ActionController::Base

    
    before_action :addingSavedlistCookies
    add_flash_types :danger, :success
    
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?
    
    
    def isProductInSavedlist(product)
      @currentUserSavedlist.products.find_by(id: product.id) ? true : false
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
    
    def current_user
        puts "----------Calling helper method in application record #{session[:user_id]}"
        @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
        current_user
    end
end