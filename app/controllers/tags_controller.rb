require './lib/importio.rb'

class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @tag_posts = @tag.posts.reject do |post|
      categorized_post_ids.include?(post.id)
    end
  end

  def update
    params[:tag] = { id: params[:id] }
    create
  end

  def create
    tag = Tag.where(permitted_params).first_or_create
    Importer.new(tag).import

    flash[:notice] = 'Tag has been imported'

    redirect_to tag_path(tag)
  end

  private

  def permitted_params
    params[:tag].permit(:id, :term)
  end

  def categorized_post_ids
    Bucket.all.map { |b| b.related_posts.map(&:post_id) }.flatten
  end
end
