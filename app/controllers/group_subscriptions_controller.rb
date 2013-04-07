class GroupSubscriptionsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    group = Group.find(params[:group_id])

    @user.subscribe!(group)

    redirect_to user_group_path(@user.id, group.id)
  end

  def destroy
    subscription = GroupSubscription.find(params[:id])
    @user = subscription.user

    subscription.destroy

    redirect_to user_group_path(@user.id, subscription.group_id)
  end
end