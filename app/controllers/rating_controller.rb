class RatingController < ApplicationController
  
   before_action :authorization, only: [:index, :create]
  
  def index
    rating = Rating.find_by(user_id: current_user.id)
    if (rating)
      redirect_to root_path
    end
  end
  
  def create
    Rating.create(user_id: current_user.id, rate: params[:rate])
    redirect_to root_path, success: "Thank you for your feedback!"
  end
  
  private
    def authorization
        if session[:user_id].blank?
            redirect_to root_path
        end
    end
end
