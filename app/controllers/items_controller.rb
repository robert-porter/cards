class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index

    if(params[:q] == nil)
      @items = Item.all
    else
      words = params[:q].split(' ')
      index = 1
      items = Item.where('tags LIKE ?', "%#{words[0]}%")

      #this is just a temp hack, need proper precedence
      while index < words.size
        if words[index] == 'and' && index + 1 < words.size
          right = Item.where('tags LIKE ?', "%#{words[index + 1]}%")
          items = items & right
          index = index + 2
        elsif words[index] == 'or' && index + 1 < words.size
          right = Item.where('tags LIKE ?', "%#{words[index + 1]}%")
          items = items | right
          index = index + 2
        else # no operator is the same as or
          right = Item.where('tags LIKE ?', "%#{words[index]}%")
          items = items | right
          index = index + 1
        end
      end

      @items = items
    end
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    return if @failed 
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    return if @failed
  end

  # POST /items
  def create
    return if @failed

    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    return if @failed

    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    return if @failed

    @item.destroy

    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @failed = false
      if !@is_admin
        render(:file => File.join(Rails.root, 'public/422.html'), :status => 422, :layout => false)
        @failed = true
      end

      begin
        if !@failed
          @item = Item.find(params[:id])
        end
      rescue
        render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
        @failed = true
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :image, :tags)
    end
end
