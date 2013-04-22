module ApplicationHelper
  def submit_button_to(text, object, options = {})
    link_to text, object, options.merge(class: "btn #{options[:primary] ? 'btn-primary' : ''}")
  end

  def heading_link_to(text, url, options = {})
    content_tag :h2 do
      link_to(text, url, options)
    end
  end

  def accordion_group(text, url, options = {})
    content_tag :div, class: "accordion-group #{options[:class]}" do
      content_tag :div, class: "accordion-heading" do
        link_to text, url, class: "accordion-toggle"
      end
    end
  end
end