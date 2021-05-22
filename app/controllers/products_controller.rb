class ProductsController < ApplicationController
  def index
    @products = Product.all
    
  end

  def new
    @product = Product.new
  end
  
  def create
  end

  def edit
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def search
    redirect_to product_searched_path(words: params[:search].split)
  end
  
  def searched
    @products = []
    
    Product.all.each do |product|
      found = false
      
      params[:words].each do |word|
        product.stocks.distinct.pluck(:colour).each do |colour|
          
          if colour.downcase == word.downcase
            found = true
            break
          end
        end
        
        if found or product.name.downcase.match(word.downcase)
          found = true
          break
        end
      end
      
      if found
        @products.append(product)
      end
    end
    
    
  end
  
  private
  def stock_quantity_params
    params.require(:product).permit(:product_id, :size, :colour)
  end
end
