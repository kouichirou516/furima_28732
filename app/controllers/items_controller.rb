class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,]
  
  def index
    @items = Item.order("id DESC")
    end

  def new
    @item = Item.new
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:shipping_charge_id,:area_id,:shipping_time_id,:price).merge(user_id: current_user.id)
  end
end
