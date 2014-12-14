require './lib/importio.rb'

class UpdateController < ApplicationController
  QUERIES = ['Ruby_on_Rails', 'Ruby']

  def index
    QUERIES.each do |term|
      Importer.new(term).import
    end

    redirect_to posts_path
  end
end
