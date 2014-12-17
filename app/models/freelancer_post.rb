class FreelancerPost < BasePost
  def tags
    @post.data['skills']
  end

  def budget
    @post.data['price/source'].andand.join || 'No budget'
  end

  def posted
    ''
  end
end
