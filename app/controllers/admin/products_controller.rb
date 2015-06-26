class Admin::ProductsController < Admin::AdminController

  def create
    @product = Product.new product_params
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path }
        format.js   {}
      else
        format.html { redirect_to products_path }
      end
    end
  end

  def new
    @product = Product.new
  end

  def update
    @product = Product.find(params[:id])
    if @product.update product_params
      respond_to do |format|
        format.html { redirect_to products_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def index
    @products = Product.all
    @product = Product.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :synonyms)
  end
end
