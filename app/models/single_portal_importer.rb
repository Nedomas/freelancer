class SinglePortalImporter
  def initialize(portal)
    @portal = portal
  end

  def klass
    "#{@portal}Importer".classify.constantize
  end

  def import(term)
    (1..2).each do |page|
      page_import(term, page)
    end
  end

  def page_import(term, page)
    import_data = ImportioManager.query(portal_importer(term, page))
    import_results(import_data['data']['results'])
  end

  def portal_importer(term, page)
    klass.new(term, page)
  end

  def import_results(results)
    results.each do |result|
      next if Post.any? { |post| post.data == result }

      Post.create(portal: @portal, data: result)
    end
  end
end
