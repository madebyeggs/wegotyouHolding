class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_mcapi

  def setup_mcapi
    @mc = Mailchimp::API.new('56e6f1c6144810944bf0e01dd0f9a2d6-us12')
    @list_id = "da4b8b85f1"
  end
end
