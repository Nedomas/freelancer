class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all
  end

  def show
    @bucket = Bucket.find(params[:id])
    @types = Bucket::TYPES.except(@bucket.name.downcase.to_sym)
  end
end
