class GroupsController < ApplicationController
  before_filter :authorize

  def index
    @organization = Organization.includes(:groups).find(params[:organization_id])
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @group = @organization.groups.build(params[:group])

    if @group.save
      current_user.subscribe!(@group)

      redirect_to group_posts_path(@group)
    else
      render 'new'
    end
  end

  def destroy
    Group.find(params[:id]).destroy

    redirect_to root_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(params[:group])
      redirect_to group_posts_path(@group)
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