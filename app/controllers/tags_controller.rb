class TagsController < ApplicationController

  def create
    @tag = Tag.new tag_params
    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_path }
        format.js   {}
      else
        format.html { redirect_to tags_path }
      end
    end
  end

  def new
    @tag = Tag.new
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tag_params
      respond_to do |format|
        format.html { redirect_to tags_path }
        format.json { head :no_content }
        format.js   { render :layout => false }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :synonyms)
  end
end


