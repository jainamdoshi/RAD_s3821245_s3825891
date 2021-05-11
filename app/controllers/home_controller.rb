class HomeController < ApplicationController
  def index
    
    allProducts = Product.order('score DESC')
    @bannerProduct = nil;
    allProducts.each do |product|
      if !isProductInSavedlist(product)
        @bannerProduct = product
        break
      end
    end
    
    @popularItems = allProducts.first(10)
  end
  
  def newsletter
    emailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    emailAddress = params[:email]
    
    if emailAddress.match(emailRegex)
      UserNotifierMailer.send_newsletter_email(params[:email]).deliver
      redirect_to root_path, success: "Email sent"
    else
      redirect_to root_path, danger: "Invalid Email"
    end
  end
end

private 
def check_email
end 
