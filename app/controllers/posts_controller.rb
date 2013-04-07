class PostsController < ApplicationController
  before_filter :authorize

  def index
    @user = User.includes([:groups, {:organizations => :groups}]).find(current_user.id)

    @selected_group = Group.find(params[:group_id]) if params[:group_id]

    organization_id = params[:organization_id] || (@selected_group && @selected_group.organization_id)
    @selected_organization = Organization.find(organization_id) if organization_id
  end
end
