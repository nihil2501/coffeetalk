module SidebarHelper
  def link_to_reading_list
    active = sidebar.reading_list?
    icon   = active ? "icon-list icon-white" : "icon-list"

    accordion_group_link_to("Reading List", reading_list_path, active, icon)
  end

  def link_to_new_organization
    active = sidebar.creating_organization?

    accordion_group_link_to(
      "Create a new organization",
      new_organization_path,
      active,
      active ? "icon-pencil icon-white" : "icon-pencil"
    )
  end

  def link_to_edit_organization(organization)
    active = sidebar.editing_organization?(organization)

    if active
      content_for :javascript do
        render(partial: 'sidebar/edit_organization', locals: { organization: organization })
      end
    end

    li_icon_link_to("Edit", edit_organization_path(organization), active, nil)
  end

  def link_to_new_group(organization)
    active = sidebar.creating_group?(organization)

    li_icon_link_to(
      "Create a new group",
      new_organization_group_path(organization),
      active,
      "icon-pencil"
    )
  end

  def organization_accordion_group(organization)
    accordion_group(
      organization.name,
      "#{organization.id}-collapse",
      "organization-accordion",
      sidebar.current_organization?(organization)
    ) { yield }
  end

  def group_links(groups)
    groups.map { |group| link_to_group(group) }.join.html_safe
  end

  def link_to_group(group)
    li_icon_link_to(
      group.name,
      group_posts_path(group_id: group.id),
      sidebar.current_group?(group),
      current_user.groups.include?(group) && "icon-check"
    )
  end

  def link_to_leave_organization(organization)
    content_tag :li do
      link_to(
        "Leave",
        organization_membership_path(current_user.organization_memberships.find_by_organization_id(organization).id),
        confirm: "Are you sure?",
        method: :delete
      )
    end
  end

  def link_to_delete_organization(organization)
    content_tag :li do
      link_to(
        "Delete",
        organization_path(organization),
        method: :delete,
        confirm: "Are you sure?"
      )
    end
  end

  def manage_organization_toggle(text, icon = nil)
    li_icon_link_to(text, "#", false, icon, class: "organization-toggle")
  end
end