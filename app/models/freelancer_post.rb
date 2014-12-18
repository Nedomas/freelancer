class FreelancerPost < BasePost
  def tags
    Nokogiri::HTML(@post.data['skills']).css('li').map(&:text).map(&:strip)
  end

  def budget
    @post.data['price/source'].andand.join || 'No budget'
  end

  def posted
    ''
  end
end
