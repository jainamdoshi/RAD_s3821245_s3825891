class CategoriesController < ApplicationController
  def show
    
    @items = Category.find(params[:id]).products
    
  end
end
