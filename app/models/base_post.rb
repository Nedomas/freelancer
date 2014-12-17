class BasePost
  include ActionView::Helpers::SanitizeHelper

  def initialize(post)
    @post = post
  end

  def title
    @post.data['title'] || 'No title'
  end

  def description
    decorate_description(@post.data['description'])
  end

  def url
    @post.data['title']
  end

  def tags
    Array(raw_tags)
  end

  private

  def raw_tags
    @post.data['skills'].andand.split
  end

  def decorate_description(raw)
    strip_links(sanitize(raw, tags: ['br'])).html_safe
  end
end
