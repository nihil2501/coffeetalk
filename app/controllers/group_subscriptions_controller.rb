class GroupSubscriptionsController < ApplicationController
  def create
    current_user.subscribe!(Group.find(params[:group_id]))
    redirect_to :back
  end

  def destroy
    GroupSubscription.find(params[:id]).destroy
    redirect_to :back
  end
end