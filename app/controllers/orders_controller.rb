class OrdersController < ApplicationController
  def index
  
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new


  end

  def create 
    @item = Item.find(params[:item_id])
    @order_delivery_address = OrderDeliveryAddress.new(order_params) 
    if @order_delivery_address.valid?
      pay_item
     
       @order_delivery_address.save    
       redirect_to root_path
    else
      render "orders/index"
    end
  end

  private
  

  def order_params
    params.require(:order_delivery_address).permit(:post_code, :prefecture_id, :city, :address, :building_name,
                                                   :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = "sk_test_103ee32d6aef03a685ac7cb1"
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
  end

          
end
