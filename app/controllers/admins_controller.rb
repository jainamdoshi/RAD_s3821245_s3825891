class AdminsController < UsersController
    
    before_action :authorization
    
    def saved_items
        @users = User.all
    end
    
    def purchased_items
    end
    
    def ratings_summary
      @ratings = {}
      Rating.distinct.pluck(:rate).each do |rateValue|
      @ratings[rateValue] = Rating.where(:rate => rateValue).count
      end
    end
    
    def newsletter_subscriptions
      @users = User.all
    end
    
    private
        def authorization
          if session[:user_id].blank?
            redirect_to new_session_path
          else
            if !current_user.admin
              redirect_to user_path(current_user().id)
            end
          end
        end
end
