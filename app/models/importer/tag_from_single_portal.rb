module Importer
  class TagFromSinglePortal
    def initialize(tag, portal)
      @tag = tag
      @portal = portal
    end

    def import
      (1..3).each do |page|
        page_importer = Importer::Page.new(@portal, @tag, page)
        page_importer.import
      end
    end
  end
end
