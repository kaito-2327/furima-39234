class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.buy.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: buy_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end


  def buy_params
    params.require(:buy_delivery).permit(:post_code, :prefecture_id, :municipality, :address, :bldg, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
