class SinglePortalImporter
  def initialize(portal)
    @portal = portal
  end

  def klass
    "#{@portal}Importer".classify.constantize
  end

  def import(tag)
    (1..3).each do |page|
      page_import(tag, page)
    end
  end

  def page_import(tag, page)
    import_data = ImportioManager.query(portal_importer(tag, page))
    import_results(import_data['data']['results'], tag)
  end

  def portal_importer(tag, page)
    klass.new(tag.term, page)
  end

  def import_results(results, tag)
    results.each do |result|
      next if Post.any? { |post| post.data == result }

      post = Post.create(portal: @portal, data: result)
      TagPost.create(post: post, tag: tag)
    end
  end
end
