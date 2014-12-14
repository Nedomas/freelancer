class ElanceImporter
  def initialize(term, page)
    @term = term
    @page = page
  end

  def url
    "https://www.elance.com/r/jobs/q-#{serialized_term}/p-#{@page}"
  end

  def serialized_term
    @term.parameterize('%20')
  end

  def guid
    '6d38aea1-d93b-4a19-b146-4a443aec1433'
  end
end
