class Admin::OrdersController < Admin::AdminController
  protect_from_forgery except: [:pay_pal_hook]
  def pay_pal_hook

    PayPal.create_order_from_ipn(params)
    render nothing: true
  end

  def index
    @show_unprocessed_orders = params[:show_unprocessed_orders]
    if @show_unprocessed_orders == '1'
      @orders = Order.all
    else
      @orders = Order.where(:processed => false)
    end

  end

  def show
    @order = Order.find params[:id]
  end

  def toggle_processed
    order = Order.find params[:id]
    order.processed = !order.processed
    order.save

    @order = order.next || order.prev

    if @order == nil
      render 'orders/no_unprocessed_orders'
    else
      redirect_to admin_order_path @order
    end
  end


end