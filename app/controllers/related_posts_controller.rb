class RelatedPostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @related_post = RelatedPost.new(post: @post, bucket: todo_bucket)
  end

  def create
    RelatedPost.create(permitted_params)

    flash[:notice] = 'Post added'

    redirect_to posts_path
  end

  def reject
    @post = Post.find(params[:id])
    RelatedPost.create(post: @post, bucket: rejected_bucket)

    flash[:notice] = 'Post rejected'

    redirect_to posts_path
  end

  private

  def permitted_params
    params[:related_post].permit(:notes, :post_id, :bucket_id)
  end

  def todo_bucket
    Bucket.where(name: 'Todo').first_or_create
  end

  def rejected_bucket
    Bucket.where(name: 'Rejected').first_or_create
  end
end
