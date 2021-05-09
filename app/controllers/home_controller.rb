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
    puts "params #{params}"
    UserNotifierMailer.send_newsletter_email("jainam.doshi2001@gmail.com").deliver
    redirect_to(root_path)
  end
end
