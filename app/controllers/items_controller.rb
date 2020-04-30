class ItemsController < ApplicationController
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
    @image = ProductImage.find_by(product_id: params[:id])

    # #プロダクトid=1のときの、id=1を表示している
    # # @category = Category.find_by(level: @product[:id])

    # #プロダクトid=1のときの、parent_id=1を表示している
    # # @category = Category.find_by(parent_id: @product[:category_id])
    
    # #プロダクトの登録通り、categoryid:26の場合
    # @category = Category.find_by(id: @product[:category_id])
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end
