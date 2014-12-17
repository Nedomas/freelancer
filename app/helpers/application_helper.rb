module ApplicationHelper
  def kbd(tags)
    Array(tags).map { |t| "<kbd>#{t}</kbd>" }.join(' ').html_safe
  end
end
