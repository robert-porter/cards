class TagsController < ApplicationController

  def index
    flash[:notice] = ''
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @items = Item.tagged_with(@tag.name).paginate(:page => params[:page])
    flash[:notice] = 'Showing items with tag ' << @tag.name
    render :'items/index'
  end

  def create

    @tag = ActsAsTaggableOn::Tag.new
    @tag.name = params[:tag_name]
    if @tag.save
      flash[:notice] = 'Tag sucessfully created.'
    else
      flash[:notice] = 'Failed to create tag!'
    end

    redirect_to tags_path
  end

  def destroy
    tag = ActsAsTaggableOn::Tag.find(params[:id])
    tag.destroy

    redirect_to tags_url, notice: 'Item was successfully destroyed.'
  end

end
