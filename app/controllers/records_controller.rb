class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    
    if @record_address.valid?
      pay_item
       @record_address.save
     redirect_to root_path
    else
      render :index
    end
  end


 private
    def record_params
      params.require(:record_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token] )
    end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: record_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end


  
end
