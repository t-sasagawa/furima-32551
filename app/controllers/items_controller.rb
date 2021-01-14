class ItemsController < ApplicationController

before_action :set_item, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]
before_action :contributor_confirmation, only: [:edit, :update, :destroy]
before_action :sold_out_no_view, only:[:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :state_id, :fee_id, :prefecture_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

  def sold_out_no_view
    redirect_to root_path unless @item.order == nil
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end