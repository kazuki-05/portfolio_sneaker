class ItemsController < ApplicationController
  def index
    if (params[:brand_id]).present?
      @posts =Post.where(brand_id: params[:brand_id])
    else
      @posts =Post.all
    end

    # if (params[:brand_name]).present?
    #   @itme_name = params[:brand_name]
    # else
    #   @itme_name = "商品"
    # end

  @brands = Brand.all
  end

#   def show
#     @brands = Genre.all
#     @item = Item.find(params[:id])
#     @cart_item = CartItem.new
#   end
end
