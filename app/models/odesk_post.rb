class OdeskPost < BasePost
  def budget
    "#{@post.data['type']} #{@post.data['budget']}"
  end

  def tags
    @post.data['tags'].andand.split
  end

  def posted
    @post.data['posted']
  end
end
