class Admin::DashboardController < Admin::BaseController

  # Require authentication only for edit and delete operation
  before_filter :authenticate, :only => :show

  def show
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
       id == USERNAME && password == PASSWORD
    end
  end

end
