module Importer
  class OdeskImporter
    def initialize(term, page)
      @term = term
      @page = page
    end

    def multiple_url
      "https://www.odesk.com/o/jobs/browse/?q=#{serialized_term}&page=#{@page}"
    end

    def serialized_term
      @term.parameterize('+')
    end

    def single_guid
      '688452f2-95fc-41ae-99ad-2be5a760e7c4'
    end

    def multiple_guid
      '697a6f09-f930-4865-9a5f-61e8f014b7bc'
    end

    def extract_multiple_urls(resp)
      Importer::Manager.extract(resp).map { |record| record['title'] }
    end
  end
end
