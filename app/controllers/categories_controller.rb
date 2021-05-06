class CategoriesController < ApplicationController
  def show
    
    @cat_id = Category.find(params[:id]).name
    
  end
end
