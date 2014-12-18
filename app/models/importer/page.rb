module Importer
  class Page
    def initialize(portal, tag, page)
      @portal = portal
      @tag = tag
      @page = page
    end

    def import
      urls.each do |url|
        next unless Post.where(url: url).count.zero?

        resp = Importer::ImportioWrapper.query(url, portal_importer.single_guid)
        save_full_data(url, resp)
      end
    end

    def save_full_data(url, resp)
      data = Importer::Manager.extract(resp)

      post = Post.create(portal: @portal, url: url, data: data.first)
      TagPost.create(post: post, tag: @tag)
    end

    def klass
      "Importer::#{@portal.capitalize}Importer".constantize
    end

    def portal_importer
      klass.new(@tag.term, @page)
    end

    def urls
      resp = Importer::ImportioWrapper.query(portal_importer.multiple_url,
        portal_importer.multiple_guid)
      portal_importer.extract_multiple_urls(resp)
    end

    def import_results(results)
      results.each do |result|
        post = Post.create(portal: @portal, data: result)
        TagPost.create(post: post, tag: @tag)
      end
    end
  end
end
