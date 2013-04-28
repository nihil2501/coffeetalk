class OrganizationMembershipsController < ApplicationController
  def destroy
    OrganizationMembership.find(params[:id]).destroy
    redirect_to root_path
  end
end