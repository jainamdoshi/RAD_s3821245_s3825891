class CategoriesController < ApplicationController
  def show
    @filterOption = true
    session[:return_to] = request.original_url
    
    puts session[:filters]
    
    if !session[:filters].blank?
      @items = []
      
      if !session[:filters].include? "All"
      
        Category.find(params[:id]).products.each do |product|
          
          found = false
          
          product.product_tags.each do |tag|
            
            if session[:filters].include? "COL#{tag.tag}" 
              found = true
              break
            end
          end
        
          product.stocks.distinct.pluck(:colour).each do |colour|
            if session[:filters].include? "CLR#{colour}"
              found = true
              break
            end
          end
        
          product.stocks.distinct.pluck(:size).each do |size|
            if session[:filters].include? "SIZ#{size}"
              found = true
              break
            end
          end
          
          @items.append(product) if found
          puts @items
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
