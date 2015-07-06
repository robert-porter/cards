class OrderController < ApplicationController
  protect_from_forgery except: [:pay_pal_hook]
  def pay_pal_hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == 'Completed'
      @item = Item.find params[:invoice]
      @order = Order.new
      @order.update_attributes notification_params: params,
                               status: status,
                               transaction_id: params[:txn_id],
                               purchased_at: Time.now,
                               item_id: @item.id,
                               quantity: 1
    end

    render nothing: true
  end

end