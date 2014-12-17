module Importer
  class Manager
    def initialize(tag)
      @tag = tag
    end

    def import
      %i(freelancer odesk elance).each do |portal|
        tag_importer = Importer::TagFromSinglePortal.new(@tag, portal)
        tag_importer.import
      end
    end

    def self.extract(resp)
      resp['data']['results']
    end
  end
end
