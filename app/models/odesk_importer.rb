class OdeskImporter
  def initialize(term, page)
    @term = term
    @page = page
  end

  def url
    "https://www.odesk.com/o/jobs/browse/?q=#{serialized_term}&page=#{@page}"
  end

  def serialized_term
    @term.parameterize('+')
  end

  def guid
    '697a6f09-f930-4865-9a5f-61e8f014b7bc'
  end
end
