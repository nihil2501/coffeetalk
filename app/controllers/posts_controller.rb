class PostsController < ApplicationController
  before_filter :authorize

  def index
    @group = Group.find(params[:group_id])
  end
end
