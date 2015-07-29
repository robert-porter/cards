class Admin::ItemsController < Admin::AdminController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions, only: [:new, :create, :edit, :update, :destroy ]

  # GET admin/items
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

  # GET admin/items/new
  def new
    @item = Item.new
  end

  # GET admin/items/clone
  def clone
    item = Item.find(params[:id])
    image_url = item.image
    @item = item.dup
    @image_url = "#{image_url}"
    @item.tag_list = item.tag_list
    render :edit
  end

  # GET admin/items/1/edit
  def edit
  end

  # POST admin/items
  def create

    @item = Item.create(item_params)
    @item.tag_list = params[:tag_list]
    image_url_param =  params.require('item').permit('image_url')
    if image_url_param != nil && image_url_param['image_url'] != ''
      file = File.open(File.join(Rails.root, 'public/', image_url_param['image_url']))
      @item.image = file
    end

    if @item.save
      flash_message :notice, 'Item was successfully created.'
      redirect_to @item
    else
      render :new
    end
  end

  # PATCH/PUT admin/items/1
  def update
    @item.tag_list = params[:tag_list]
    if @item.update(item_params)
      flash_message :notice, 'Item was successfully updated.'
      redirect_to @item
    else
      render :edit
    end
  end

  # DELETE admin/items/1
  def destroy
    @item.destroy

    flash_message :notice, 'Item was successfully destroyed.'
    redirect_to items_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def search_params

  end

  def advanced_search_params

  end

  def item_params
    params.require(:item).permit(
        :name,
        :description,
        :team_id,
        :image,
        :manufacturer_id,
        :product_id,
        :year,
        :grade,
        :price,
        :quantity,
        :card_number,
        :price,
        :shipping_price)
  end
end

