class Tag < ActiveRecord::Base
  has_many :tag_posts

  def posts
    tag_posts.map(&:post)
  end
end
