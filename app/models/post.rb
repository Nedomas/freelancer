class Post < ActiveRecord::Base
  serialize :data

  def method_missing(name, *args)
    super rescue "#{portal}Post".classify.constantize.new(self).send(name)
  end
end
