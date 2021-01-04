class ItemsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :state_id, :fee_id, :prefecture_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

end