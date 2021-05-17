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
  
  private
  def stock_quantity_params
    params.require(:product).permit(:product_id, :size, :colour)
  end
end
