
class ItemsController < ApplicationController

  # GET /items
  def index
    if params[:q] == nil
      @items = advanced_search params, params[:page] || 1, 12
    else
      @items = parse_query params, params[:page] || 1, 12
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])
    @item.views = @item.views + 1
    @item.save
  end

  def buy
    @item = Item.find(params[:id])

    values = {
        business: 'robert.j.porter10-facilitator@gmail.com',
        cmd: '_xclick',
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{items_path @item}",
        invoice: @item.id,
        amount: @item.price_cents / 100,
        item_name: @item.annotated_name,
        item_number: @item.id,
        quantity: '1',
        #notify_url: "#{Rails.application.secrets.app_host}/pay_pal_hook"
    }
    redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
