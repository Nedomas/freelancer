module Importer
  class ElanceImporter
    def initialize(term, page)
      @term = term
      @page = page
    end

    def multiple_url
      "https://www.elance.com/r/jobs/q-#{serialized_term}/p-#{@page}"
    end

    def serialized_term
      @term.parameterize('%20')
    end

    def single_guid
      '3d77249b-a5ab-4ede-acce-6c88d83c723d'
    end

    def multiple_guid
      '6d38aea1-d93b-4a19-b146-4a443aec1433'
    end

    def extract_multiple_urls(resp)
      Importer::Manager.extract(resp).map { |record| record['title'] }
    end
  end
end
