class Importer
  def initialize(term)
    @term = term
  end

  def import
    %i(freelancer odesk).each do |portal|
      single_importer = SinglePortalImporter.new(portal)
      single_importer.import(@term)
    end
  end
end
