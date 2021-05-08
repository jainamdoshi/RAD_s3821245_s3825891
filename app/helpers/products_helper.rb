module ProductsHelper
    def isProductInSavedlist(product)
      return @currentUserSavedlist.products.find_by(id: product.id) ? true : false
    end
end
