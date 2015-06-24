
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions, only: [:new, :create, :edit, :update, :destroy ]

  # GET /items
  def index
    if params[:q] == nil
      @items = WillPaginate::Collection.create(params[:page] || 1, 12) do |pager|
        result, total_items = advanced_search params, pager.offset, pager.per_page
        pager.replace(result)
        pager.total_entries = total_items
        pp total_items
      end
    else
      @items = WillPaginate::Collection.create(params[:page] || 1, 12) do |pager|
        result, total_items = parse_query params, pager.offset, pager.per_page
        pager.replace(result)
        pager.total_entries = total_items
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /items/1
  def show
    @item.views = @item.views + 1
    @item.save
    return if performed?
  end

  # GET /items/new
  def new
    return if performed?
    @all_tags = Tag.all
    @item = Item.new
  end

  def clone
    item = Item.find(params[:id])
    image_url = item.image
    @item = item.dup
    @image_url = "#{image_url}"
    @item.tag_list = item.tag_list
    pp @item
    render :edit
  end

  # GET /items/1/edit
  def edit
    return if performed?
  end

  # POST /items
  def create
    return if performed?

    @item = Item.new(item_params)
    @item.tag_list = params[:tag_list] || ''
    image_url_param =  params.require('item').permit('image_url')
    if image_url_param != nil && image_url_param['image_url'] != ''
      file = File.open(File.join(Rails.root, 'public/', image_url_param['image_url']))
      @item.image = file
    end
    pp @item
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    return if performed?
    @item.tag_list = params[:tag_list]
    pp params.require(:item).permit(:tag_list)
    pp @item.tags
    if @item.update(item_params)

      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    return if performed?

    @item.destroy

    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      begin
        @item = Item.find(params[:id])
      rescue
        render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
      end
    end

    def check_permissions
      if !@is_admin
          render(:file => File.join(Rails.root, 'public/422.html'), :status => 422, :layout => false)
      end
    end

    def item_params
      params.require(:item).permit(:name, :description, :tag_list, :team_id, :image, :manufacturer_id, :product_id, :year, :grade, :price, :quantity)
    end
end
