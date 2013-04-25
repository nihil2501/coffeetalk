module ApplicationHelper
  def li_icon_link_to(text, url, active, icon, options = {})
    content_tag :li, class: "#{'active' if active}" do
      link_to url, options do
        concat text
        concat(content_tag :i, '', class: "#{icon} pull-right") if icon
      end
    end
  end

  def accordion_group_link_to(text, url, active, icon = nil)
    content_tag :div, class: "accordion-group#{' active' if active}" do
      content_tag :div, class: "accordion-heading" do
        link_to url, class: "accordion-toggle" do
          concat text
          concat(content_tag :i, '', class: "#{icon} pull-right") if icon
        end
      end
    end
  end

  def accordion_group(text, target, parent, active)
    content_tag :div, class: "accordion-group#{' active' if active}" do
      heading = content_tag :div, class: "accordion-heading" do
        link_to text, "##{target}", class: "accordion-toggle", :"data-toggle" => "collapse", :"data-parent" => "##{parent}"
      end

      body = content_tag :div, id: target, class: "accordion-body collapse#{' in' if active}" do
        content_tag :div, class: "accordion-inner" do
          yield
        end
      end

      concat heading
      concat body
    end
  end
end