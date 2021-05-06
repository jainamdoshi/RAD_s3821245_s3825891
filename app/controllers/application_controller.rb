class ApplicationController < ActionController::Base
    before_action :addingSavedlistCookies
    
    private
        def addingSavedlistCookies
            
            if (cookies[:savedlist_id].blank?)
                savedlist = Savedlist.create()
                @currentUserSavedlistID = savedlist.id
                cookies.permanent[:savedlist_id] = @currentUserSavedlistID
            else
                @currentUserSavedlistID = cookies[:savedlist_id]
            end
            
            # cookies[:name] = "Jainam"
        end
end