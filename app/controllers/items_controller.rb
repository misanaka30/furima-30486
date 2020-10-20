class ItemsController < ApplicationController
  def index
    #@items = Items.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :describe, :category_id, :status_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end
end
