class PostsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @organization = @group.organization

    sidebar.showing_group = @group
  end
end
