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
end
