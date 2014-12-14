class Importer
  def initialize(tag)
    @tag = tag
  end

  def import
    %i(freelancer odesk elance).each do |portal|
      single_importer = SinglePortalImporter.new(portal)
      single_importer.import(@tag)
    end
  end
end
