class FilterController < ApplicationController
  
  def index
    @disablePartial = true
    @collectionTags = ["all","outdoor","blazers", "tops", "outdoors", "top","blazer"]
    @colorTags = ["blue", "pink","Black","Yellow"]
     @sizeTags = ["s","m","l","xl","xxl"]
  end
  
  def update
    puts "-------------Reached Into Update-----------"
  end

end
