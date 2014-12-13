class Post < ActiveRecord::Base
  serialize :data

  def title
    data['link_1/_text']
  end

  def description
    data['text_1']
  end

  def url
    data['link_1']
  end

  def tags
    data['hiddenlink_link_list/_text'].join(', ')
  end
end
