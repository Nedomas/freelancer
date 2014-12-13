class Bucket < ActiveRecord::Base
  has_many :related_posts

  def posts
    related_posts.map(&:post)
  end
end
