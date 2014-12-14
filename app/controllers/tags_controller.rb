require './lib/importio.rb'

class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def create
    tag = Tag.create(permitted_params)
    Importer.new(tag).import

    flash[:notice] = 'Tag has been imported'

    redirect_to tag_path(tag)
  end

  private

  def permitted_params
    params[:tag].permit(:term)
  end
end
