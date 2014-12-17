class Post < ActiveRecord::Base
  serialize :data
  has_one :related_post

  def method_missing(name, *args)
    super rescue "#{portal}Post".classify.constantize.new(self).send(name)
  end
end
