class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery
  private

  helper_method :current_user, :signed_in?
end
