class OrganizationsController < ApplicationController
  def destroy
    Organization.find(params[:id]).destroy
    redirect_to root_url
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(params[:organization])

    if @organization.save && @organization.organization_memberships.create(user_id: current_user.id)
      redirect_to new_organization_group_url(@organization)
    else
      @organization.destroy if @organization.id

      render 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes(params[:organization])
      redirect_to root_url
    else
      render 'edit'
    end
  end
end