module ApplicationHelper
  def submit_button_to(text, object, options = {})
    link_to text, object, options.merge(class: "btn #{options[:primary] ? 'btn-primary' : ''}")
  end

  def heading_link_to(text, url, options = {})
    content_tag :h2 do
      link_to(text, url, options)
    end
  end
end