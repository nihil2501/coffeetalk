module SidebarHelper
  def sidebar_new_organization
    provided = yield_content!(:sidebar_new_organization)
    default  = link_to_new_organization(false)

    provided.blank? ? default : provided
  end

  def link_to_new_organization(active)
    accordion_group_link_to(
      "Create a new organization",
      new_organization_path,
      active,
      "icon-pencil"
    )
  end

  def link_to_reading_list
    accordion_group_link_to("Reading List", reading_list_path, @organization.nil?)
  end

  def content_for_sidebar_organizations(organization)
    content_for :sidebar_organizations do
      yield
      sidebar_organization(organization)
    end
  end

  def sidebar_organizations
    provided = yield_content!(:sidebar_organizations)
    default  = current_user.organizations.map { |organization|
      sidebar_organization(organization)
    }.join.html_safe

    provided.blank? ? default : provided
  end

  def sidebar_organization(organization)
    render(
      partial: 'shared/sidebar/organization',
      locals: { organization: organization }
    )
  end

  def sidebar_edit_organization(organization)
    provided = yield_content!(:sidebar_edit_organization)
    default  = link_to_edit_organization(organization, false)

    provided.blank? ? default : provided
  end

  def link_to_edit_organization(organization, active)
    if active
      content_for :javascript do
        render(partial: 'shared/sidebar/edit_organization', locals: { organization: organization })
      end
    end

    li_icon_link_to("Edit", edit_organization_path(organization), active, nil)
  end

  def sidebar_new_group(organization)
    provided = yield_content!(:sidebar_new_group)
    default  = link_to_new_group(organization, false)

    provided.blank? ? default : provided
  end

  def link_to_new_group(organization, active)
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
      organization == @organization
    ) { yield }
  end

  def group_links(groups)
    groups.map { |group| link_to_group(group) }.join.html_safe
  end

  def link_to_group(group)
    li_icon_link_to(
      group.name,
      group_posts_path(group_id: group.id),
      group == @group,
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