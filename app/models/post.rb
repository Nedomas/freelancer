class Post < ActiveRecord::Base
  serialize :data

  def title
    data['title/_text']
  end

  def description
    data['description']
  end

  def url
    data['title']
  end

  def tags
    Array(raw_tags).join(', ')
  end

  private

  def raw_tags
    data['skills_link/_text']
  end
end
