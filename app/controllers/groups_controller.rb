class GroupsController < ApplicationController
  before_filter :authorize

  def index
    @user = current_user
    @organization = Organization.find(params[:organization_id])
    @groups = @organization.groups
  end

  def new
    @user = current_user
    @organization = Organization.find(params[:organization_id])
    @group = @organization.groups.build
  end

  def create
    @user = current_user
  end

  def destroy
    @user = current_user
  end
end