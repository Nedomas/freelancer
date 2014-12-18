class ScrapePortalsJob < ActiveJob::Base
  queue_as :default

  def perform(tag)
    Importer::Manager.new(tag).import
  end
end
