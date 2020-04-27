class ItemsController < ApplicationController
  def show
    @products = Product.all
    @products = ProductImage.all
    @product = ProductImage.find(params[:id])
    @product = Product.find(params[:id]) 
    # @categories = Category.all
    # @category = Category.find(category_id)
  end 
end
