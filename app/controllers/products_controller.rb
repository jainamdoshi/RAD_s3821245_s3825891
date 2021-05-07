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
    @productid = Product.find(params[:id])
  end
end
