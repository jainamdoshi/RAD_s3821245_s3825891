class CategoriesController < ApplicationController
  def show
    @filterOption = true
    session[:return_to] = request.original_url
    
    puts session[:filters]
    
    if !session[:filters].blank?
      @items = []
      
      if !session[:filters].include? "All"
      
        Category.find(params[:id]).products.each do |product|
          
          product.product_tags.each do |tag|
            
            if session[:filters].include? tag.tag 
              @items.append(product)
            end
          end
        end
        
      else
        @items = Category.find(params[:id]).products
      end
      session.delete(:filters)
    else
      @items = Category.find(params[:id]).products
    end
    
  end
end
