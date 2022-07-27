class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  
  def index
    @order_delivery_address = OrderDeliveryAddress.new
    redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
      pay_item

      @order_delivery_address.save
      redirect_to root_path
    else
      render 'orders/index'
    end
  end

  private
  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_delivery_address).permit(:post_code, :prefecture_id, :city, :address, :building_name,
                                                   :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
