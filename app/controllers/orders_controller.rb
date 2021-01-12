class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = ShippingOrder.new
    if nil != @item.order
      redirect_to root_path
    end
  end

  def create
    @order = ShippingOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end

private

  def order_params
    params.require(:shipping_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

