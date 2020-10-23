class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit] 
  before_action :set_item, only: [:edit, :show]

  def index 
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :describe, :category_id, :status_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


end

