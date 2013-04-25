module SidebarHelper
  def edit_organization_li_link(organization)
    content_for(:edit_organization_li_link) ||
    render(partial: 'shared/sidebar/edit_organization', locals: { organization: organization, active: false })
  end

  def new_group_li_link(organization)
    content_for(:new_group_li_link) ||
    render(partial: 'shared/sidebar/new_group', locals: { organization: organization, active: false })
  end

  def group_li_links(organization)
    content_for(:group_li_links) ||
    organization.groups.each do |group|
      concat render(partial: 'shared/sidebar/group', locals: { group: group, active: false })
    end
  end
end