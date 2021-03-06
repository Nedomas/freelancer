class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
    @tag_posts = @tag.posts.reject do |post|
      categorized_post_ids.include?(post.id) or !post.data
    end
    @tag_posts.sort_by!(&:updated_at).reverse!
  end

  def update
    params[:tag] = { id: params[:id] }
    create
  end

  def create
    tag = Tag.where(permitted_params).first_or_create
    ScrapePortalsJob.perform_later(tag)

    flash[:notice] = 'Wait a sec till the tag is imported'

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
