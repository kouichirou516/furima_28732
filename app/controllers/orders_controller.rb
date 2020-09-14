class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :seller_redirect
  before_action :set_item, only: [:index, :create]
  
  def index
    @order = OrderShippingAddress.new
  end

  

    
  def create

    @order = OrderShippingAddress.new(order_params)
    
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  
  private

  def order_params
    @current_item = Item.find(params[:item_id])
    params.require(:order_shipping_address).permit(:prefectures_id,:postal_code,:city,:address,:building,:phone_number).merge(user_id: current_user.id, item_id: @current_item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def seller_redirect
    #出品者が直接URLを打ち込み購入ページにアクセスした時トップページに戻る。
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif !@item.order.nil?
      redirect_to root_path
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
  end
end
