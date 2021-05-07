module ApplicationHelper
    def isProductInSavedlist(product)
      savedlist = Savedlist.find(@currentUserSavedlistID)
      return savedlist.products.find_by(id: product.id) ? true : false
    end
end
