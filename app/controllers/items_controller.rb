
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_permissions, only: [:new, :create, :edit, :update, :destroy ]



  # GET /items
  def index
    if(params[:q] == nil)
      @items = Item.paginate(:page => params[:page])
    else
      @items = parse_query_language(params[:q]).evaluate.paginate(:page => params[:page])
    end

  end

  # GET /items/1
  def show
    return if performed?

    @team = Team.find(@item.team_id)
    @manufacturer = Manufacturer.find(@item.manufacturer_id)
  end

  # GET /items/new
  def new
    return if performed?
    @all_tags = ActsAsTaggableOn::Tag.all()
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    return if performed?

    if @item.manufacturer_id != nil
      @manufacturer = Manufacturer.find(@item.manufacturer_id)
    else
      @manufacturer = Manufacturer.where(:name => 'None').first
      @item.manufacturer_id = @manufacturer.id
    end
    if @item.team_id != nil
      @team = Team.find(@item.team_id)
    else
      @team = Team.where(:name => 'None').first
      @item.team_id = @team.id
    end

    @teams = Team.all
    @manufacturers = Manufacturer.all

    @all_tags = ActsAsTaggableOn::Tag.all()
    @tags_list_string = ''
    @item.tags.each_with_index do |tag, i|
      @tags_list_string << tag.name
      @tags_list_string << ', ' if i < @item.tags.size - 1
    end
  end

  # POST /items
  def create
    return if performed?

    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    return if performed?

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :image, :page, :tag_list, :team_id, :manufacturer_id, :year)
    end
end
