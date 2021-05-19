class HomeController < ApplicationController
  def index
    
    allProducts = Product.order('RANDOM()')
    @bannerProduct = nil;
    allProducts.each do |product|
      if !isProductInSavedlist(product)
        @bannerProduct = product
        break
      end
    end
    
    @popularItems = Product.order('score DESC').first(10)
    @collections = Category.all
  end
  
  def newsletter
    emailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    emailAddress = params[:email]
    
    if emailAddress.match(emailRegex)
      UserNotifierMailer.send_newsletter_email(params[:email]).deliver
      letter = Newsletter.new(email: emailAddress)
      letter.save
      redirect_to root_path, success: "Email sent"
    else
      redirect_to root_path, danger: "Invalid Email"
    end
  end
  
  def newsletterupdate
    
    if Newsletter.find_by(email: current_user.email)
      Newsletter.delete(Newsletter.find_by(email: current_user.email).id)
    else
      Newsletter.create(email: current_user.email)
    end
    redirect_to user_path(current_user)
  end
  
  
end
