class ItemsController < ApplicationController
  def show
    @products = Product.all
    @product = Product.find(params[:id]) 
    @images = ProductImage.all
    @image = ProductImage.find(params[:id])
  end 
end
