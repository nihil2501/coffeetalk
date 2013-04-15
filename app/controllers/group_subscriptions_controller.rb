class GroupSubscriptionsController < ApplicationController
  before_filter :authorize

  def create
    group = Group.find(params[:group_id])
    current_user.subscribe!(group)

    redirect_to :back
  end

  def destroy
    subscription = GroupSubscription.find(params[:id])
    subscription.destroy

    redirect_to :back
  end
end