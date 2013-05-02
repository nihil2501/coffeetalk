class GroupsController < ApplicationController
  def create
    @organization = Organization.find(params[:organization_id])
    @group = @organization.groups.build(params[:group])

    if @group.save
      current_user.subscribe!(@group)

      redirect_to group_posts_url(@group)
    else
      render 'new'
    end
  end

  def destroy
    Group.find(params[:id]).destroy

    redirect_to root_url
  end

  def edit
    @group = Group.find(params[:id])
    @organization = @group.organization
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to group_posts_url(@group)
    else
      render 'edit'
    end
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @group = @organization.groups.build
  end
end