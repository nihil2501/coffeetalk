module SidebarHelper
  def edit_organization_li_link(organization)
    provided = content_for(:edit_organization_li_link)
    default  = render(
      partial: 'shared/sidebar/edit_organization',
      locals: { organization: organization, active: false }
    )

    provided.blank? ? default : provided
  end

  def new_group_li_link(organization)
    provided = content_for(:new_group_li_link)
    default  = render(
      partial: 'shared/sidebar/new_group',
      locals: { organization: organization, active: false }
    )

    provided.blank? ? default : provided
  end
end