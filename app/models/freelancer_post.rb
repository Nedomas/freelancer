class FreelancerPost
  def initialize(post)
    @post = post
  end

  def title
    @post.data['title/_text']
  end

  def description
    @post.data['description']
  end

  def url
    @post.data['title']
  end

  def tags
    Array(raw_tags).join(', ')
  end

  private

  def raw_tags
    @post.data['skills_link/_text']
  end
end
