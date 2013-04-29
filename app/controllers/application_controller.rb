class ApplicationController < ActionController::Base
  include Clearance::Controller
  include SidebarHelper

  protect_from_forgery
  before_filter :authorize

  # http://stackoverflow.com/questions/6902531/how-to-eager-load-associations-with-the-current-user
  def current_user
    @current_user ||= super && User.includes([:groups, {:organizations => :groups}]).find(super.id)
  end
end
