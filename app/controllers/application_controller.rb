class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery

  include SidebarHelper

  # http://stackoverflow.com/questions/6902531/how-to-eager-load-associations-with-the-current-user
  def current_user
    @current_user ||= super && User.includes([:groups, {:organizations => :groups}]).find(super.id)
  end
end
