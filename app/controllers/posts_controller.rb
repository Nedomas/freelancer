class PostsController < ApplicationController
  def index
    @posts = Post.where.not(id: categorized_post_ids)
    @tag = Tag.new
  end

  private

  def categorized_post_ids
    Bucket.all.map { |b| b.related_posts.map(&:post_id) }.flatten
  end
end
