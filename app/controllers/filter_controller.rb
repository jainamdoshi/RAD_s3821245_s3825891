class FilterController < ApplicationController
  
  def index
    # @disablePartial = true
    
    @collectionTags = ["All"] 
    (ProductTag.all).each { |tag| @collectionTags.append(tag.tag) }
    puts "--------#{Product.all}--------"
    @colourTags = [] 
    @sizeTags = []
    (Product.all).each { |product| 
      product.stocks.distinct.pluck(:colour).each { |colour| @colourTags.append(colour) if !@colourTags.include? colour }
      product.stocks.distinct.pluck(:size).each { |size| @sizeTags.append(size) if !@sizeTags.include? size }
    }
  end
  
  def update
    puts "-------------Reached Into Update-----------"
    # session[:filte
    filters = []
    params.each { |key,value| filters.append(key) if value == "1" }
    puts " #{filters}"
    session[:filters] = filters
    redirect_to session.delete(:return_to)
  end

end
