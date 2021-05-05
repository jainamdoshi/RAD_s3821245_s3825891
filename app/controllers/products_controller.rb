class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def edit
  end
  
  def show
    @productid = Product.find(params[:id])
  end
end
