class SavedlistsController < ApplicationController
  
  def show
    @listItem = Savedlist.find(@currentUserSavedlist.id).products
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
    # savedlist = Savedlist.find(@currentUserSavedlistID)
    product = Product.find(params[:id])
    savedlist_product = @currentUserSavedlist.products.find_by(id: params[:id])
    if(savedlist_product)
      @currentUserSavedlist.products.delete(savedlist_product)
    else
      @currentUserSavedlist.products << product
    end
    
    @listItem = @currentUserSavedlist.products
    # redirect_to products_path
    redirect_back(fallback_location: root_path)
  
  end
  
    private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end