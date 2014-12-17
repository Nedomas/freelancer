class Bucket < ActiveRecord::Base
  has_many :related_posts

  def posts
    related_posts.map(&:post)
  end

  class << self
    def considering
      Bucket.where(name: 'Considering').first_or_create
    end

    def rejected
      Bucket.where(name: 'Rejected').first_or_create
    end

    def bidded
      Bucket.where(name: 'Bidded').first_or_create
    end
  end
end
