class ElancePost < BasePost
  def budget
    @post.data['budget']
  end

  def tags
    [@post.data['category'], @post.data['subcategory'], raw_skills].flatten
  end

  def posted
    ''
  end

  private

  def raw_skills
    (@post.data['skills'] || '').split(',').map(&:strip)
  end
end
