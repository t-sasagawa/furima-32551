class OrdersController < ApplicationController

  before_action :set_item
  before_action :contributor_confirmation, except: :create

  def index
    @order = ShippingOrder.new
    if nil != @item.order
      redirect_to root_path
    end
  end

  def create
    @order = ShippingOrder.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end

  

  private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def order_params
      params.require(:shipping_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
    end

    def contributor_confirmation
      redirect_to root_path if current_user.id == @item.user_id
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )      
    end
end