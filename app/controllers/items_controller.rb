class ItemsController < ApplicationController
  before_action :set_current_user

  GROUP_ITEM_STATUS = 100
  GROUP_ITEM_POSTAGE = 101
  GROUP_ITEM_DELIVERY_TIME = 102
  def index
  end

  def new
    @item_explanation_placeholder = "商品の説明（必須 1,000文字以内）\r\n（色、素材、重さ、定価、注意点など）\r\n\r\n例）2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。"
    @item = Product.new
    @item.product_images.build
    @statuses = Code.group_search(GROUP_ITEM_STATUS)
    @postages = Code.group_search(GROUP_ITEM_POSTAGE)
    @delivery_times = Code.group_search(GROUP_ITEM_DELIVERY_TIME)
    @prefectures = Prefecture.all
  end

  def create
  end


  def show
    @product = Product.find(params[:id])
    @grandchild = Category.find_by(id: @product[:category_id])
    @children = Category.find_by(id: @grandchild[:parent_id])
    @parent = Category.find_by(id: @children[:parent_id])
    @prefecture = Prefecture.find_by(id: @product[:prefecture_id])
    @status = Code.find_by(id: @product[:status])
    @delivery = Code.find_by(id: @product[:delivery_time_code])
    @postage = Code.find_by(id: @product[:postage_code])
    @image = ProductImage.find_by(product_id: params[:id]) 
    @images = ProductImage.where(@product[:product_id])
  end

  private
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end
