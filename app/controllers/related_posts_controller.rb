class RelatedPostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @related_post = RelatedPost.new(post: @post, bucket: Bucket.considering)
    session[:return_to] ||= request.referer
  end

  def create
    related_post = RelatedPost.create(permitted_params)

    flash[:notice] = "Post considered: #{related_post.post.title}"

    redirect_to session.delete(:return_to) || :back
  end

  def reject
    @post = Post.find(params[:id])
    related_post = RelatedPost.find_or_initialize_by(post: @post)
    related_post.update(bucket: Bucket.rejected)

    flash[:notice] = "Post rejected: #{@post.title}"

    redirect_to :back
  end

  private

  def permitted_params
    params[:related_post].permit(:notes, :post_id, :bucket_id)
  end
end
