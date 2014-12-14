class FreelancerImporter
  def initialize(term, page)
    @term = term
    @page = page
  end

  def url
    "https://www.freelancer.com/jobs/#{serialized_term}/#{@page}"
  end

  def serialized_term
    @term.parameterize('_')
  end

  def guid
    'cd209c40-4e36-40c1-a0eb-bcc6afe0902f'
  end
end
