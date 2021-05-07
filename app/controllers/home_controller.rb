class HomeController < ApplicationController
  def index
    @bannerProduct = Product.first
  end
end
