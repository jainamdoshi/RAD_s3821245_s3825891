class CategoriesController < ApplicationController
  def show
    @filterOption = true
    @items = Category.find(params[:id]).products
    
  end
end
