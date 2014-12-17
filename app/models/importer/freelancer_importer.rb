module Importer
  class FreelancerImporter
    def initialize(term, page)
      @term = term
      @page = page
    end

    def multiple_url
      "https://www.freelancer.com/jobs/#{serialized_term}/#{@page}"
    end

    def serialized_term
      @term.parameterize('_')
    end

    def single_guid
      '8d045e80-f2cc-490b-965c-e5e7dbb0252d'
    end

    def multiple_guid
      'cd209c40-4e36-40c1-a0eb-bcc6afe0902f'
    end

    def extract_multiple_urls(resp)
      Importer::Manager.extract(resp).map { |record| record['title'] }
    end
  end
end
