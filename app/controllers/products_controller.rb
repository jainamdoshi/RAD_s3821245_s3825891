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
    @stock = @product.stocks.first 
    puts "-------------------------------------------------------------------------------- #{params[:size]}"
    @stockQuantity = Stock.find_by(stock_quantity_params).quantity
  end
  
  private
  def stock_quantity_params
    params.require(:product).permit(:size, :colour)
  end
end
