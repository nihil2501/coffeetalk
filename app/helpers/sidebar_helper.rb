module SidebarHelper
  def sidebar_reading_list
    content_for(:sidebar_reading_list) || li_link_to_reading_list(false)
  end

  def li_link_to_reading_list(active)
    accordion_group_link_to("Reading List", reading_list_path, active)
  end

  def sidebar_new_organization
    content_for(:sidebar_new_organization) || li_link_to_new_organization(false)
  end

  def li_link_to_new_organization(active)
    accordion_group_link_to(
      "Create a new organization",
      new_organization_path,
      active,
      "icon-pencil"
    )
  end

  def sidebar_organizations
    content_for(:sidebar_organizations) || render(
      partial: 'shared/sidebar/organization',
      collection: current_user.organizations,
      locals: { active: false }
    )
  end

  def sidebar_edit_organization(organization)
    content_for(:sidebar_edit_organization) || li_link_to_edit_organization(organization, false)
  end

  def li_link_to_edit_organization(organization, active)
    if active
      content_for :javascript do
        render(partial: 'shared/sidebar/edit_organization', locals: { organization: organization })
      end
    end

    li_icon_link_to("Edit", edit_organization_path(organization), active, nil)
  end

  def sidebar_new_group(organization)
    content_for(:sidebar_new_group) || li_link_to_new_group(organization, false)
  end

  def li_link_to_new_group(organization, active)
    li_icon_link_to(
      "Create a new group",
      new_organization_group_path(organization),
      active,
      "icon-pencil"
    )
  end

  def organization_accordion_group(organization, active)
    accordion_group(organization.name, "#{organization.id}-collapse", "organization-accordion", active) do
      yield
    end
  end

  def group_li_links(groups)
    groups.map { |group| li_link_to_group(group) }.join.html_safe
  end

  def li_link_to_group(group)
    li_icon_link_to(
      group.name,
      group_posts_path(group_id: group.id),
      group == @group, current_user.groups.include?(group) && "icon-check"
    )
  end

  def li_link_to_leave_organization(organization)
    link_to(
      "Leave",
      organization_membership_path(current_user.organization_memberships.find_by_organization_id(organization).id),
      confirm: "Are you sure?",
      method: :delete
    )
  end

  def li_link_to_delete_organization(organization)
    link_to(
      "Delete",
      organization_path(organization),
      method: :delete,
      confirm: "Are you sure?"
    )
  end

  def li_organization_toggle(text, icon = nil)
    li_icon_link_to(text, "#", false, icon, class: "organization-toggle")
  end
end