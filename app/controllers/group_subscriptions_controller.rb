class GroupSubscriptionsController < ApplicationController
  before_filter :authorize

  def create
    group = Group.find(params[:group_id])
    current_user.subscribe!(group)

    redirect_to posts_path(group_id: group.id)
  end

  def destroy
    subscription = GroupSubscription.find(params[:id])
    subscription.destroy

    redirect_to posts_path(group_id: subscription.group_id)
  end
end