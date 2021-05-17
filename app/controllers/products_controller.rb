class ProductsController < ApplicationController
  def index
    @products = Product.all
    
  end

  def new
    @product = Product.new
  end
  
  def create
    # @product = Product.create(product_params)
    redirect_to product_path(4)
  end

  def edit
  end
  
  def show
    @product = Product.find(params[:id])
    
    # puts params
    # puts findFilter
    
    
    # if findFilter
    #   @stockQuantity = Stock.find_by(product_id: @product.id, colour: params[:colour], size: params[:size]).quantity
    #   redirect_to product_path(@product)
    # else
    #   @stockQuantity = 0
    # end
    #   puts @stockQuantity
    
    if (params[:size])
      @stockQuantity = Stock.find_by(product_id: @product.id, colour: params[:colour], size: params[:size]).quantity
      # redirect_to product_path(@product)
    else
      @stockQuantity = @product.stocks.first.quantity
    end
    puts "-------------------------------------------------------------------------------- #{params}"
    puts @stockQuantity
  end
  
  # def quan
  #   puts "Jainam"
  #   @stockQuantity = Stock.find_by(product_id: 3, colour: params[:colour], size: params[:size]).quantity
  #   redirect_to product_path(:id=>3)
  # end
  
  private
  
  # def findFilter
  #   if (@stockQuantity != 0 params[:size] && )
  #     @size = params[:size]
  #     @colour = params[:colour]
  #     return true;
  #   end
  #     return false;
  # end
  
  def stock_quantity_params
    params.require(:product).permit(:product_id, :size, :colour)
  end
end
