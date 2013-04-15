class GroupsController < ApplicationController
  before_filter :authorize

  def index
    @organization = Organization.includes(:groups).find(params[:organization_id])
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @group = @organization.groups.build(params[:group])

    if @group.save
      redirect_to organization_groups_path(@organization)
    else
      render 'new'
    end
  end

  def destroy
    @organization = Organization.find(params[:organization_id])

    group = Group.find(params[:id])
    group.destroy

    redirect_to organization_groups_path(@organization)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @group = @organization.groups.build
  end
end