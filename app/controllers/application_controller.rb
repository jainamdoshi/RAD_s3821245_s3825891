class ApplicationController < ActionController::Base
    before_action :addingSavedlistCookies
    
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
end