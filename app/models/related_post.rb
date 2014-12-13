class RelatedPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :bucket
end
