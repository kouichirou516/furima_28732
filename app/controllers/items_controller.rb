class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  
  def index
    @items = Item.order("id DESC")
    end

  def new
    @item = Item.new
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def show
  end
  

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
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

  def set_item
    @item = Item.find(params[:id])
  end
end
