
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


end
