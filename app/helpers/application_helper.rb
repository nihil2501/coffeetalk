module ApplicationHelper
  def organization_accordion_group(organization, options = {})
    accordion_group(organization.name, '', :"data-parent" => "#organization-accordion", class: options[:active] ? 'active' : '') do

    end
  end

  def accordion_group(text, url, options = {})
    content_tag :div, class: "accordion-group #{options[:"accordion-group"][:class]}" do
      content_tag :div, class: "accordion-heading" do
        link_attributes = { class: "accordion-toggle" }

        extra_attributes = {
          :"data-toggle" => "collapse",
          :"data-parent"
        }

        link_to text, url, class: "accordion-toggle"
      end

      yield
    end
  end

  def accordion_group_link(text, url, options = {})
    accordion_group(options) do
      accordion_heading_link(text, url, options = {})
    end
  end

  def accordion(options = {})
    content_tag :div, class: "accordion", id: "#{options[:id]}" do
      accordion_group(accordion: options)
    end
  end

  def accordion_group(options = {})
    content_tag :div, class: "accordion-group #{options[:class]}" do
      accordion_heading(accordion_group: options)
    end
  end

  def accordion_heading(options = {})
    content_tag :div, class: "accordion-heading" do
      accordion_toggle(accordion_heading: options)
    end
  end

  def accordion_toggle(options = {})
    link_to text, url, {
      class: "accordion-toggle",
      :"data-toggle" => "collapse",
      :"data-parent" => options[:accordion_heading][:accordion_group][:accordion][:id]
    }
  end

  def accordion_body
  end
end