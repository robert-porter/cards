class Admin::CategoryController < Admin::AdminController

  class << self
    attr_accessor :model
  end

  def model
    self.class.model
  end

  helper_method :model

  def create
    @category = model.create category_params
    respond_to do |format|
      format.js   { render 'admin/category/create' }
    end
  end

  def new
    @category = model.new
  end

  def update
    @category = model.find(params[:id])
    if @category.update category_params
      respond_to do |format|
        format.js   { render 'admin/category/update' }
        return
      end
    end
  end

  def destroy
    category = model.find(params[:id])
    category.destroy

    respond_to do |format|
      format.js { render 'admin/category/destroy' }
    end
  end

  def index
    @categories = model.sorted
    @category = model.new
  end

  private

  def category_params
    model_sym = model.model_name.param_key
    params.require(model_sym).permit(:name, :synonyms)
  end
end