class SavedlistsController < ApplicationController
  
  def show
    @listItem = Savedlist.find(@currentUserSavedlistID).products
  end
  
  def create
    
    # productid = params[:product_id]
    # savedlistid = @currentUserSavedlistID
    # savedlist = Savedlist.find(savedlistid)
    # product = Product.find(productid)
    # savedlist.products << product
    # @listItem = savedlist.products
    # redirect_to products_path
    # @listItem = CreateProductsSavedlists.new({:product_id => params[:product_id], :savedlist_id=>1})
  end
  
  def update
    savedlist = Savedlist.find(@currentUserSavedlistID)
    product = Product.find( params[:product_id])
    savedlist_product = savedlist.products.find_by(id: params[:product_id])
    if(savedlist_product)
      savedlist.products.delete(savedlist_product)
    else
      savedlist.products << product
    end
    
    @listItem = savedlist.products
    redirect_to products_path
  
  end
  
    private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end